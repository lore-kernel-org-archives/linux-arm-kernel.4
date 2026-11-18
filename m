Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3B3606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yPYkyhZQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YkKcKa96
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=; b=yPYkyhZQb25yTleigR8rJvXwR4
	KlHNKiGBoP1TRqajBp7Tf7syYPZPTuaOKCUuso4wpBI2li2FSdfreK/wT39Jn8uBTtTVElnf5goNr
	DBiUioYZ0BZhvpRUVDGqsXu6l1XrwW6aLmjKo+llJDhvtZfJwO9UoygSS+SHqObhNg1wuW7fnQC79
	VXAsVo63Isd+zqT99aAuT2sG/69xU3K6I2MPQ1I02v4QyC5CntYrXzDKH9+OKYl9gnID9+0/Djq+y
	JjOC9NNv8aELDGYBj8MRiH/D91g73AbB+wFppdUe3f1Zes4PEFQal3Cs7r6gqlJVTKyM5yGwmTmxi
	82qLvzRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiMF-00000009RE6-3zyc;
	Wed, 18 Nov 2026 16:18:03 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiMC-00000009RBZ-1h8r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:18:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-49a92144733so549863f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018677; x=1795623477; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
        b=YkKcKa96bH+weo+r00CKxtddjGQ2qdMC5B9cA67Rp0apGqxfbxq9IU3r5lo8PJWrvh
         8+jHZwCbZdM4+UEWz4xhVEZuRQQcaT29Ob3TSA4GrZqsrBrXJm/VcRKHGxvQnYv8qtMa
         D4c2w3PtQLbAwzvRUlAAJNeA7+KweZ4povwQ3e986XhIKYc7DFpaVkhkkDHVuW9zTsVf
         4BsAMk+4r6l+qw0O8q/FJb0vPEs/ch9T9e6RpV+y1J5X00iNGGpngBKYVCplMywPzSHc
         SEbUdcIQfA6fw9rXQu9hOrbkXIQ99yBQkN8Nqreus/YONncdV9ltYfGhRMgH543/tWBv
         CHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018677; x=1795623477;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
        b=VBZ7mutCMXzwEslaRwx5JC85QHjWA3Qbaojg8rwxPYPukbUJuXTmNMjZhMrCr+kovv
         lTbUBCU/lsy8Dpcbbf4A0UF74cK8Knr1u/eWTJn7HyO1WeQT+XmBvTcnT3nkQTOzEAF+
         nXFlLMl5DwL2xEkjcoNf0LUExTNTquydETqteAAw0nE0vt8ytmzZpqEUhq+r8gmiiz52
         WV5g1/ZNdhUZrmJV2D7xuOx2P9Watsp++5vHrWbCSnT93CShOpwjnTL+qP0MvKRh42rV
         +w2l+1NEihykiwVIOdbBXrk9siS3CZh652xP0OKWtnrBhroCdPnYvwggEvva4X8+sgo6
         BbUQ==
X-Forwarded-Encrypted: i=1; AL+hErEUUBIyZ06NMY8s09N9MrHfijLY/gxVTd69boS0fZJV+VPtjS2/XQf1jPlOLCJHr9U/ieIoWvwg8hgGB1Cm5hCJ@lists.infradead.org
X-Gm-Message-State: APuU4Z9c2ndgiS+xqjeNJ9ZN6hgG2faHAJ0MWPaq+GWCJmIFILr3BtWS
	frRMVqYcjeD+xHzQzm70aBek9L8Clk/UlCjIwV0ZOZatX6rNfvo5IhY/
X-Gm-Gg: AZFdTZcSv9iB74BEYMekLjfxgsikcGgmkZyPRuhABHMfiYaoN5+irKFvpX26Cim1NSW
	7VT9NpgeUdiZdoI7p1RljMLImXKluRS10YuNpvfSaRF+S1bXrLGDQlLHJgM3uLk94q8ktSKyHfO
	DLWCDGUrPk6havXwdyQD9opI4TnJtXUMyUJCAY23en3OzCy0HDFxM9aY8mri/02zf8E4CTgEerw
	U+u2Bk8oNrdaDsBYGEeQmXlN+o5q+s87pjPHxurmhznrfbD8Dnxc/3OChBNuObvnQGj+pfrhMBe
	N5t6tv0MQ6NijUGAX0PqrKVLzjril5Z4pzYKzS7b1Q6OQiIA6tqvmzXG7+p4prgIRTfhVnjNQxt
	aIUP0Cmz9MXvraV//K7V0m8hFO1ETyb9VBxV1KL22Hz8NY1LP42bPa0zGI0BmCnIxYbw3CCnQ0G
	g79N0h4Lr6RpZANuWD25HW9lQs2jd5Z9Nl6/gxR9PXJWJcSWvILNm86+0xW6c6B4wR8C6/2lkus
	Arw47dE0Xm2hF+OeLEXhNmjt+9vI7/vumR5cA/y2MFRO0gswBzey35i228VOn6h7lr4xUCWG2Nr
	dWWetUhCremANtCfjRmk4fiULBAXv7yK9o43P6b5LG4wH+0qDGt2x2N43ac9w5HMMghZRMiUi0d
	oiVAl9qUkJqBI2+FQaEWuCKoIWIJREFcByg==
X-Received: by 2002:a05:6000:3104:b0:4a7:557:fcc with SMTP id ffacd0b85a97d-4a705665645mr5379933f8f.53.1795018676598;
        Wed, 18 Nov 2026 08:17:56 -0800 (PST)
Received: from [10.161.246.232] (host-164-37-100-34.net.onlyservers.com. [164.37.100.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100bf42sm5329699f8f.1.2026.11.18.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:17:56 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH v2 0/2] pinctrl: mediatek: Add MT6895 support
Date: Wed, 18 Nov 2026 19:17:35 +0300
Message-Id: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6DIBQFr2L+ujSAVKmr3qNxgRT1NwoGqGlju
 HvFrrucZN68DYLxaAI0xQberBjQ2R34qQA9KjsYgo+dgVNeMUYlWdDq6Ccyx0peL0QKyTmndS+
 Uhn20eNPj+wje2x+HV/c0OuZKNkYM0fnP8biy7P2Nr4xQ0tdUaCHKrmTqNswKp7N2M7QppS+y8
 HwtvgAAAA==
X-Change-ID: 20261108-pinctrl-mt6895-84822207f4ac
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_081800_492400_BA5726A3 
X-CRM114-Status: GOOD (  12.79  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the pin controller of the MediaTek Dimensity 8000/8100
(MT6895) SoC: the binding and a driver on top of the common Paris code.

The pinmux macro header and the pio node are part of v2
of the MT6895 / Xiaomi Poco X4 GT initial support series [1].

The tables come from the MediaTek driver in the Xiaomi kernel source
release [2]. They were checked field by field against that driver and
against register dumps from the device running the vendor kernel.

Tested on a Xiaomi Poco X4 GT (xaga) on top of next-20261117: pinmux,
pin configuration, GPIO and EINT.

[1] https://patch.msgid.link/20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com
[2] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/56ec519f6
    (branch xaga-s-oss)

Assisted-by: Claude:claude-opus-5-5

---
Changes in v2:
- pinctrl-mt6895: pad mt6895_pull_type[] with entries for the virtual
  EINT pins 227-246 to avoid an out-of-bounds read from
  mtk_pinconf_bias_get_combo() (e.g. via debugfs pinconf-pins)
  (Sashiko)
- Rebased on next-20261117
- Link to v1: https://patch.msgid.link/20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com

---
Alexander Letuchiy (2):
      dt-bindings: pinctrl: mediatek: Document MT6895 pin controller
      pinctrl: mediatek: Add support for MT6895 pinctrl

 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  |  228 ++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6895.c          | 1638 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h      | 2717 ++++++++++++++++++++
 5 files changed, 4594 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261108-pinctrl-mt6895-84822207f4ac

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>


