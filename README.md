# MotleySpiders overview and instructions

Hi. Let me briefly describe this unusual collection. The main idea is that this is not just a set of collectible cards, but a digital puzzle. Each spider from this collection is present in the main image. This image was encoded in **base64** code, and then original image was completely destroyed. Each card has unlockable content in **JSON** format.

*Example:*
```
{
  "name": "<card name>",
  "family": "<spider family>",
  "genus": "<spider genus>",
  "species": "<spider species>",
  "gender": "<spider gender>",
  "image": {
    "base64": "<base64 code of original 8-bit 24x24 pixel PNG image of spider with transparent background>"
  },
  "part": {
    "base64":"<part of 8-bit 576x576 pixel PNG image base64 code(part of main image)>"
  },
  "next": "<name of card with next part of main image base64 code>"
}
```

So, to restore main image, you need to collect unlockable content of every card in this collection. Code cannot be assembled if at least one **base64** part is missing, or if parts are assembled in the wrong order. The problem is complicated by the fact, that the card with which you need to start is unknown. The solution is to assemble all parts of the code in one line without spaces and line breaks in the correct order, and then decode it with any available **base64** decoder to PNG image. How to collect and assemble all the parts in the right order, this is exclusively your choice.

But in this repository I have a convenient solution for linux users. 

1. Clone this repo:
```
git clone https://github.com/MotleySpiders/MotleySpiders.git
```
2. Make subfolder for **JSON** files in cloned repo folder:
```
cd ./MotleySpiders
mkdir ./json
```
3. Prepare empty **JSON** files for your unlockable content:
```
cd ./json
for i in {1..108}; do touch "./MotleySpider #${i}.json"; done
```
4. Copy all unlockable content to the corresponding files
5. Make sure that you have this utilities in your system:
  * jq
  * base64
7. To get all original 8-bit 24x24 pixel **PNG** images with transparent background run:
```
chmod +x ./decode_images.sh && ./decode_images.sh
```
All images will appear in ./images subfolder.

8. To assemble all parts of **base64** code and decode it to main image run:
```
chmod +x ./assemble_parts.sh && ./assemble_parts.sh
```
Main image with name _result.png_ will appear in current folder.

And you are winner!!! Good luck!
