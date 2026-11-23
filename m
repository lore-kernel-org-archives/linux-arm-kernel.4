Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XexJJDLM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgCKoOpB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=i+HRgjfbHqWxOklnWxJGQb2C0xrnW6LaMXMeG0b6UMY=; b=XexJJDLM56t3uJWuQbIWTVWdHw
	CfCysY8TlgbdeKY78JPpDHDC3bEhuzwUsSLfVgpksSOAzIHpKLulk3EtbjYQjCkZmUZgnuw/SO1Fc
	T72FWyaoRRmE3aojijbKKuqgvGCjt29d2MOjgTwYDuV82pkWw0EbwXuaQzloieUJSufrqHP990bAL
	wOtkEd1+OrLhQBevckRFHkKsDxAO69njW/ghtyaWS6ShrW0VKHiRs3x/n8dNPSbv7MUSNnlu2zPoU
	a0jSfcwGBC8f//zyxG50CC+ykO27hB4Edm8RluGjJaFRrtDDGjR7OzDbq6hkRywYV+DpssfhTiyI2
	gbxgN5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVV27-00000003kPC-29Kh;
	Mon, 23 Nov 2026 14:28:39 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVV24-00000003kOk-0otk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:28:37 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-15ea896ddc8so5618192c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795444115; x=1796048915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+HRgjfbHqWxOklnWxJGQb2C0xrnW6LaMXMeG0b6UMY=;
        b=EgCKoOpBOJ/aPOaYPDIvo9pJ5RMHm8cQ9g6qFj/YUEkV2N/iiLSMTlVexrLxrjnPnx
         2kJhqPaSSIAZKEmGl1dY3X2XnDabrDA3A2y6/4LhnZDB5QCG3XSFKhTXa+7SjcwQgeUp
         SWgtQsw+w6Y3+WEH2yBY5EbcgymMCEmpWRgY5RuiXGi7v8taobpwwlFFfIgWrhQXqND8
         xzKq5ZgAbxrybHcDShE2OwpCNXWzHriHcIgU6V1300tiMltCR/RGJu6LskEoXUENW8+O
         gdu4JS8fcABZMD01liV0ks+GpmklLLeNJwaTbSjIB4/ZaYByRj8l+Z0tzSQ0pHMmHd/g
         uA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444115; x=1796048915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i+HRgjfbHqWxOklnWxJGQb2C0xrnW6LaMXMeG0b6UMY=;
        b=c1Yu945Sr+l0hPSyCjFFP9Oj9brRZT/EXijqjHUxBfDT1q78mkNboOlBMVm12K+I1H
         J10z4LXsSlJGMzFExJ1ZbC7jLaCq8xbOmcAOX18fKXldW7j2bI/zohm2uEMVyKGHRP+F
         ikrvLJGykS0Jb7LohnB7vnUs2kqWBL6THudbfZnmeqBAEqZ456GXMVrxYienDTeQdxTc
         BTzATRuW6rgpYHnTXBARLxR1CsCxG3C6+BDNI+CAgHHYsJKohZPUyTCU3AkchlqWeFmf
         4a4PZq+qIzre/cKBEdxph/v/K7DwYq/jHMPP8Hgk+b90gLIzDv1o8DOsuQW+GIXY3bGU
         YrpA==
X-Forwarded-Encrypted: i=1; AL+hErHfOeaj/eFHOa1EbP3k4dXR8krpQ+C3rnXfk5Gv/AqjhimWaI4hfvCU/O+rizlbbwYI/fb3UQakw9lqRTaYY8/J@lists.infradead.org
X-Gm-Message-State: APuU4Z+3Xqhcxog1mG+/iLXck3Y1zwZg7Yo2lA/NprMKVy/mjtNu+oI4
	NI7kXbf5aIn5orQY+gspWBgiajircM9k6+LNqdl7CQsYaeF0LwgMSl16jOlwV13o
X-Gm-Gg: AZFdTZdvX3Tx31VWnGJgetxkaFu77voDWqEaoVLlHFoHI6OmsrpTztrjTQ/JjTVd6yp
	2mHs2WMbwJyVRjb0Zm1gN0vH+fTnFGYzu32BISpLrTRaK++DvOm4TrTKUBeJbcKszkMaEqKqGcD
	lOgDnD4Gx72oY43YlLRCpgCJ+aMWT00BsnBrAzvgSKlHvUr5OtjtEGbI9ySUZ4SWxMjazloYx0a
	oKEqlI1HoDYjsTIFuQuqa29O4L91vukyZztNIT5D9rIWrFaa6ufal4WW4Pp4d55Qx6oLyWiPuor
	lqD2mJqxUbGRtq8EP9RDJDBwN10F5i09fwGUZg0phobuaHsmU1WVk1RWYLvB6Fx1Q6VInRZgoIG
	aDaThyXAS8Qyi9/aihfOv4FTbfmPEGfTIQmA1wq6rqFAGd4w/tw2tiC/8NnVavnoJKIwzgQOIJ6
	X1wZhjYfFIfs65RXUNCVS7/6xocUavleaTtiB0HbEk2e/yKLt4DxcbJ30MJeD5QSk4YyBxk6clH
	3lVWamq5PgyJIcoDuhvxPkPPuTmrFDMzz0rtsDACVDFV8/Q6NNys1q/JALLUzPIxhiwf6wE+Zrs
	72K/BVCHdHpXKmQ1TSXM/fjE7vXKzsAHgCe28JxLVVufwl9GGQTpnXpjMJMBPHJ4kqxjiavLV2N
	dEW3YSeh0hGATxasRUtcPjlJqcUFwnyJ5Ni+0Un4zhaE=
X-Received: by 2002:a05:701b:2810:b0:143:5cb4:30 with SMTP id a92af1059eb24-1b5567b3391mr10290148c88.3.1795444115370;
        Mon, 23 Nov 2026 06:28:35 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:a7dc:f03c:3f60:caaf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm28671326c88.10.2026.11.23.06.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:28:34 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] ARM: bcm: support more than two CPUs on BCMBCA
Date: Mon, 23 Nov 2026 22:28:25 +0800
Message-ID: <20261123142203.3860616-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_062836_232892_8C45E416 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series extends BCMBCA SMP bring-up to SoCs with more than two
cores, such as:
- triple-core BCM63178/BCM6855
- quad-core BCM47622/BCM6755

Tested on BCM6755, a quad-core Cortex-A7 BCMBCA SoC.

Ho Jie Feng (2):
  dt-bindings: arm: cpus: Require cpu-release-addr on bca-smp
    secondaries
  ARM: bcm: support more than two CPUs on BCMBCA

 .../devicetree/bindings/arm/cpus.yaml         |  6 +--
 arch/arm/mach-bcm/Makefile                    |  1 +
 arch/arm/mach-bcm/bcmbca_headsmp.S            | 26 +++++++++++
 arch/arm/mach-bcm/bcmbca_smp.h                |  9 ++++
 arch/arm/mach-bcm/board_bcmbca.c              | 46 +++++++++++++++----
 5 files changed, 76 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm/mach-bcm/bcmbca_headsmp.S
 create mode 100644 arch/arm/mach-bcm/bcmbca_smp.h


base-commit: 21f8531821461fa0c05e4605c01d8d56d28b514e
-- 
2.53.0


