Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33819606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BYI2vq9w;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kx5AnIbO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=P78VDpsJpTz+1/Uu6wAD6OIZCd9bSuoX6Podaf0tODg=; b=BYI2vq9wRxf/hJ7tMH6eJm/plt
	3R9Fd0eF5qPGJerpSDDLsjyK7xbL7eIU5eFqrbEY2ZRZeDzPH4J1927QuIvEddqZxwCKqUu4/ezgO
	rn94m2/zS7Pb3bhoYWSW+9erohaoG6Tt3mnrf+CTgypotXIoeC+1KOejPrQYTBUlTa7mkX3/TinBb
	u6A9KRrvFaJShknThPPBQJf+3EhgIL19649zeJ9rtBTjxo04X9H2b9yuLVwbXA48mjF5GB//9dK/X
	nlDwJHb3IznN12w9k48xN9XEGuTJS0IiokeKttvG39IQ5OIp1AGT6Iz8UAod/9wYJZmxTAEAaQ0DR
	yG4kPvOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1j3-00000003dL0-0iUB;
	Mon, 16 Nov 2026 18:46:45 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1ix-00000003dHz-0w8f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:46:40 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-862a00144f1so727605a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854797; x=1795459597; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P78VDpsJpTz+1/Uu6wAD6OIZCd9bSuoX6Podaf0tODg=;
        b=kx5AnIbO3ITPD88lqiZ/O8Jt/CUzBQquIznIyCmHKVZLv63eV2zUTd/K55nzPX6PQ3
         BKw/Ls2KTH2xmbu8eG58bsH27iDDwFwxc4sst8gB3FiPRfdGX5goSCJaXKvPoLczVAte
         vhydmMrE7eDzqg2V0h1nafR3riHQHrhrwMU2p10Q2C/liKXmDYryOIReKLX/ord4EEFd
         YEVdaZFlpNnL18FWiyG9w18ojLXeTMcF5pqXUxLlUpOd+rgitz5zJ1yiqU6dHc/nt0ur
         UI8w68SR0o2xLRmyYP4l964CSA2x12nwGCk/9J9TK/qPw/MuINzYb6hKJwNfSpDu0oJg
         oaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854797; x=1795459597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P78VDpsJpTz+1/Uu6wAD6OIZCd9bSuoX6Podaf0tODg=;
        b=nA4dL7ttK6VE+kSP6+lL0jp7pjfUJFnYylQH0uzMXSYXjgkK7t9bO6axaKtHhu6fQ7
         A/kc3KdWDk7NFb/I43on3jEvjD5lFVUg9lbYHB0J30s8h+IGoFdp8hKwhq7ngLYFwrkk
         j02U5R89H8vanYGa8kGtd/EAiv7ewUWbbe2hIFy6LXH/UT+nC/5JkK5IWYvfm0/WpCEX
         LH1adBgLMJBbXobPOSgAT2AqiOtBtDZwBFivP7kcD2jakOZk49LehqSJuuZLFItw2TOq
         fzY2sUhvd/QYj8NgCxIB+TbhlA6iUEumNRBhHaL4f4IT0/CYdjq1K3160f3cVli0+aM8
         FlNQ==
X-Forwarded-Encrypted: i=1; AL+hErGHlNZyyA4U0ZKkp6d7PBxmiz6bHKE/0nb3fvdASgi0k1Tt78F4DA3gEIIZXMRi+CTyUS2OK6A1La7o1G/vfBgH@lists.infradead.org
X-Gm-Message-State: APuU4Z/XyBw5SOM2QUIEquHnKW1TlTVplo/CIzYpkHh9ijMYFsM2v7Zm
	/IRv11lWCUXiXeLdfccbS4sYWdHoCgsHGjDyLIevm85lhsDR4sFlUjbl
X-Gm-Gg: AYBFou1vGTbYkGEmgtuesgrCSVJEXvLPV4ZfQZX9ck6PA3PnPIPSxMEAOx9oW1eSR8W
	BF9P+Q9+r8Q7wNCMlfrsyajTvsWMGm9M3eBHa7o1VbGC+PpWXcOVPRt5MU46Gs0D0MlYowqIfCo
	UysfJoatLJ/GfrrGEi7strToORlRLuBLquh58FuMFRsKvCnZAqgAiC4kk8cigfMjvHaqEvNw5zv
	f/KiCFjIDKWap4DEJ07E9Oyw6DMMUBrQnl19EF8iwH+Ng21nqA6Q1GtMOsVDmPN2EHlK1RGeMiu
	f1zcUjji9Bkuc1H9giwcieeVTTVyCxuZwu1Vb0RkZ0AZcXJkDCc2E40iaYJ3A/cZm/rqnfG1sDe
	VZUnaUh/gOPMPAVdFVGHwd29N9w0xEhLg2lo+/wqW21f3047KHmp3kXs58Do55MGU8oschfAQJj
	B9gNGyQRRmm3U5J7KRaURcPcuXHckcACVKS/CI2AOCG0LfVAbf89OHuEObQHzgr4RDP657gjixY
	9Bx801F2G5bXsXSdr29QggnqqBhO4ElzFToz5KBWy5lIc++Ugveo1uQ0SpGKKdhbh8qrz/7wa4w
	CHG3tUNu+B582eSDSh/avY583uwL4hOw2vb8haBySIGN49VQYYO05Icfc3hkqD6t6HIqpR4dQ0Q
	zYwo19euzvE0gZV7ZF9+RXeujoAsq3x7KFQ3RbUE6
X-Received: by 2002:a05:6808:3186:b0:53c:7298:3591 with SMTP id 5614622812f47-56e5fd4852bmr9836229b6e.1.1794854797281;
        Mon, 16 Nov 2026 10:46:37 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:36 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v3 0/2] rtc: mt6397: provide the RTC's 32 kHz output as a
 clock
Date: Mon, 16 Nov 2026 12:46:32 -0600
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43Nyw6CMBBA0V9pZs2YTkcosPI/jItaCjbKIy0QH
 +HfDbhh6fYu7vlAdMG7CKX4QHCzj77voBScCLA30zUOfQWlACVVRlIdMVzD5DBO7o3TEMfgTOu
 7Btsx40JjGC2yuqM0ZCmrM+acIREwBFf75+acL4mAm49jH14bO9NafwJJ+lOYCSUWOs1rzistU
 z41rfGPg+1bWIVZ7a/q36tCiVRYo1VOKevj/rosyxeEFL37MAEAAA==
X-Change-ID: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=2739;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=edI0U8BJ05vm1zYUWZKlM1TrWGXlJBUbcmpWbDIqGNc=;
 b=NLQ9/9ifb2vqQe0on9JdNLDbVdTMhveUDIstOj4nsP4FUeFFlZdrmwfVC4+mYhCjsUQssYltO
 y+PtxNWp0vnACO+TbUGWxj431pgV6oe5TK+FwOAtVekLyd9sDVCpExb
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_104639_274336_D887EB96 
X-CRM114-Status: GOOD (  16.25  )
X-Spam-Score: -2.1 (--)
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MT6397 RTC drives a 32 kHz clock out of the PMIC, which boards use as
the sleep clock of a Wi-Fi/Bluetooth combo chip. RTC_CON.F32KOB gates it,
and mainline never touches that bit, so the chip only works if the
bootloader happened to turn the output on.

On the Amazon Fire HD 10 (2017), which can boot through U-Boot instead of
the vendor's LK, nothing sets it in the former - LK sets the bit at every
boot, and the MT6630 combo chip's Wi-Fi and Bluetooth never come up.
Letting the RTC provide the output as a clock lets the chip's
mmc-pwrseq-simple enable it. With the clock wired up both came up on that
board in two boots out of two, and in none of three without it.

The driver registers the clock only when the RTC node has #clock-cells,
so no existing board changes. The MT6323 shares the MT6397's driver data
and gets it too; every MediaTek PMIC RTC whose registers I could read has
F32KOB at bit 5 of RTC_CON, but for the MT6323 that is inferred from the
shared driver data rather than read from a datasheet.

Lee has applied the binding to mfd [1], so v3 is the driver part only:
patch 1 gives the existing write trigger member a name that says what it
is, as Lee asked for the new one, and patch 2 adds the clock. Both are
for rtc.

The board's devicetree that uses the clock is not upstream yet and follows
separately.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/179459615032.87488.12726056214378307165.b4-ty@b4/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v3:
- rtc: name the new struct mtk_rtc_data member control_reg, rename wrtgr
  to write_trigger_reg in a patch of its own, and the local con to
  control (Lee)
- dt-bindings: dropped, applied by Lee
- rebased onto v7.4-rc2
- Link to v2: https://lore.kernel.org/r/20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com

Changes in v2:
- rtc: check for #clock-cells before reading the driver data, which is
  NULL when the PMIC has no RTC node, as on mt8173-evb (Sashiko)
- dt-bindings: add Krzysztof's Reviewed-by
- Link to v1: https://lore.kernel.org/r/20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com

---
Ryan Brue (2):
      rtc: mt6397: rename the write trigger register offset
      rtc: mt6397: provide the 32 kHz output as a clock

 drivers/rtc/rtc-mt6397.c       | 95 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/mfd/mt6397/rtc.h |  8 +++-
 2 files changed, 99 insertions(+), 4 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


