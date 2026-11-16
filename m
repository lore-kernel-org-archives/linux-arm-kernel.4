Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D8F606A339
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r8nG+wSj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iuBKuwy/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=You1mkFXga/vHh9B3JqFjojHJL5bf7S7RuEKx8WEhTk=; b=r8nG+wSjCYl4rx+aHOaPeED7Uz
	hlrMji1/EF/VXQll+DzAqPyIaCL9sZhaSXC7xVDYLf+f3464JvUjuO69QfppjRXNBgRhrZPhBsyai
	YDND8iBym1UXTzKm7uIhzP3Xw+Sri1DM9qlYAD/S5jwVCVHvMEaAU6vFragLK0ClJsUVdlU4ag3Re
	MyYU1KWv8DuWv1NvhXmvk/jiCFiFr1ipCaMizOP4XY0AkpZWxvflg427zHrLJLs90rXqJ6MSyD7A+
	pA8AbbfhXpbhAhp2CKpFig+sVN7W0A5+DqGvHANFppPZn+J1XkzXZ0JbHk6+9wjPFiIK1h8xr0Z3z
	0b7lpGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSy4k-00000002wPo-350g;
	Mon, 16 Nov 2026 14:52:54 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSy4h-00000002wOi-2wFP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:52:53 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1b3b4944abeso965708c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840770; x=1795445570; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=You1mkFXga/vHh9B3JqFjojHJL5bf7S7RuEKx8WEhTk=;
        b=iuBKuwy/KjOnNwW+KH9Wt2Vz3fHkFYmLqCYKm6caypIFiQjCtNMlL+XcBTilrDUnuD
         NIPvUYb7xwq+rq1RSI/FuMjxXtRJVk8Nn33fFigaCDBO7SfAykzzXoygfKH/1HcbVpki
         mDUjRQ/wsI1AOW4mfleNfbv7ixg2fohCckeyDSdBtsYXf04O/J4iK/MhmM2keCaN9SvP
         KRdwEy3BrhmZWbpHe4E4a5Ml9rZ5cc4GSAW9R6Wf+4lT9VqwU51USlCWrcq2DP9+5mim
         TOliZnyq9D5y8sqOnc0G7ctpGr8dUNoKJS4YLqRMMsNP/ZH9d0ln28XQ9EbA5/7YybHG
         O1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840770; x=1795445570;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=You1mkFXga/vHh9B3JqFjojHJL5bf7S7RuEKx8WEhTk=;
        b=X5P4vRCv22i6Bt0KNi8MV/ahyaeZ5ka2JEc9tFhBFOUHGDeGC0NtSHrJs9R87IXWrI
         kMvkluNwMUGQDavQj6g2L+eDqojhX5iZWfNtpIh/9WdWGyQapQ7kn+DiC0wcHq8ZMH3M
         SlkOCCYYwjyFyN0BARcA+BnLymkREBr62ZfjxrNy1gmZuyB6smZel9dduJb7tPr5Uu84
         qXjIcaMAvrC1aD6o4Z/2cjkWanHVM0JizvIQM52+STI5EzbE8Ofqqtj68yUmdth1ReCo
         qsHYFKQkiaZB+FDK281AocDTkxhKpPJV4NzikUDOWVei2IcRW0bEDOzoGrDeNRXEbLIm
         IEMg==
X-Gm-Message-State: APuU4Z+ubYio+OM9dCS+4yueQIxdjiaeXlJpaw3T52h8CJ5enhUd1Ak9
	aW6v2RzYStZ9IIMZTQc1PJ7szQzaSDu6NDGrgDDmRNkX9uAapxrXVsMU
X-Gm-Gg: AYBFou31GZ4ioKL/LcNefYm4idtLl1Qc7/OUucF5Sn+gfoxMWnwSpIxTEjTeRoZVpuz
	gNf0xwZtiIuNmMc3ay0QJSPSZG2GLCB0eTH9CiXyAvbVFQwBq8fjkSciw3x8jtupFOL3yoPNb+8
	rMBQwybYo5GoicwSu7cUoDk2JoWsX/7m+HXyim/haKv/jfc/VQ9pQvgarRVT1lyESYXbxllv+n+
	RYl7BYnIyFqcB488sGzZ87rHnkyqXxpUiUTIK2dzkzjIwXpj0E/gWGm3SMnh3r+T+iyR5cCXkkK
	Dp7HHUe6uzTwNRcIqNzrd/0XnhrZ3xJJRyM5cFvXnb95ufXoTKNdA8MsSNTebg+txktpB+4n0Py
	Sn49ZZyNeibVu59Hu2blJc/Avug4to9ergF/ROqYE1NX32f4zkfsyRX9amHxdWjWnnVd9NWybb1
	v+LhAUVRU5gteMFhsRwa8zHlI7LiOMh4EpB/pjmd3cfPSSshZ3974+RealZ+J6by2/UgdHBpq7/
	OKigyc4yXgW0rA36Hy/QE7uoQ1lqXnnD1vu6m0cTZ0mPb0kEznkHb+WJxcajbQfwYRHFR/dq21H
	4yDDEL2c/bCSJJTXrrAR2gYddoc9epCRXMsg8PjJ8y0ZTL4=
X-Received: by 2002:a05:7022:7f14:b0:1b5:1c22:6fea with SMTP id a92af1059eb24-1b53275f63dmr2698971c88.0.1794840770041;
        Mon, 16 Nov 2026 06:52:50 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm69003540eec.20.2026.11.16.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:52:48 -0800 (PST)
From: nhansp <nhan.094.vn@gmail.com>
Subject: [PATCH 0/2] Add support for Samsung Galaxy Note8 (SM-N950N)
Date: Mon, 16 Nov 2026 21:50:32 +0700
Message-Id: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgY+2oC/yXMMQ6DMAyF4asgz7VUZwikV0EdAjHgqgUUm6oS4
 u6k7fKkb3j/DspZWOFW7ZD5LSrLXECXCvopziOjpGJwV+eJyOO2qmWOLxzL2tMYkykOLtTBJfJ
 NiFC+a+ZBPr9ue/9bt+7BvX1jcBwnMK+8tXkAAAA=
X-Change-ID: 20261116-upstream-greatlte-dts-f29792d1689a
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 nhansp <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_065251_747364_EBD446D8 
X-CRM114-Status: GOOD (  12.95  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series adds initial support for the Samsung Galaxy Note8
(SM-N950N), codenamed greatlte. It uses the same Exynos 8895 SoC as the
Galaxy S8 (dreamlte), which is already supported.

The device tree enables:
 * simple-framebuffer
 * 6GB RAM
 * pstore/ramoops
 * gpio-keys

This is enough to boot to a shell in an initramfs. More support will
follow.

The keys, framebuffer and ramoops region match dreamlte, but the board
gets its own file instead of a dtsi shared with it. I only have this
device, so I can't fully check how the bootloader lays out memory on
the other 8895 phones.

Like dreamlte, it boots through uniLoader [1], which sets the DECON
trigger control so that the framebuffer keeps refreshing.

dt_binding_check, dtbs_check W=1 and dt-check-style in strict and
stricter mode report nothing. On the device I booted next/dt64 with the
arm64 defconfig, plus ramoops, simpledrm and fbcon built in. All eight
CPUs come up and the kernel sees all 6GB. The console runs on the
framebuffer and all four keys report events. A panic triggered through
sysrq was still in pstore after the reboot.

The test image was flashed to the RECOVERY partition and booted from
there, with this kernel command line:

  console=tty0 fbcon=font:TER16x32 clk_ignore_unused pd_ignore_unused panic=15 rdinit=/init

[1] https://github.com/ivoszbg/uniLoader

---
nhansp (2):
      dt-bindings: arm: samsung: Document greatlte board binding
      arm64: dts: exynos: Add initial support for Samsung Galaxy Note8

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos8895-greatlte.dts | 124 +++++++++++++++++++++
 3 files changed, 126 insertions(+)
---
base-commit: 65ffdae53a6d522519fbd66d3cabbb4622e3e5bc
change-id: 20261116-upstream-greatlte-dts-f29792d1689a

Best regards,
--  
nhansp <nhan.094.vn@gmail.com>


