Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A696C606D1AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=meL3F6uI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKs2invd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ArOGclM53rFb6FaD30XPdpkN0QKhCsTNqoQPSptCW1M=; b=meL3F6uIqeY0km
	qMp7mStSuH/qrOzNn/cN0teNODgigCyfR2b6Ki0MZL5OPcm2ZySYMHYf1j0DVvgqacjpC1eKccV2L
	0iDnPgcc6p5OCqJyfteHJLcMfeEARv+jBnhHRGYA502sqHMsYV7niZ6Z+gvI8qzH0IND+wc3vTtjh
	cNIB8kRuDhJfJf3ji7hLefSZMDf79Gjyw0Hz84VMy8V38HkH8su8NloZIgN3dYVMa8jXtFStaQpo3
	7hMEjvheILrmasfbYGF5/QE7Gnou8Pr79yqyriFmdVFRbUB8sOx8jto9stmIebkVz5XOeLlOTIzHD
	YJOwZO4wuHmqrJ80j6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfH4-0000000BKqy-2NIK;
	Fri, 13 Nov 2026 00:36:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfH1-0000000BKoe-2weK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:36:12 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4918c2d727fso146124f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530170; x=1795134970; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ArOGclM53rFb6FaD30XPdpkN0QKhCsTNqoQPSptCW1M=;
        b=HKs2invd9CEpxRiFUd5TgfXDRImFDjUiMLk+XqxBCZZJi+JhQC6nwJiBpAVf6Ijv7N
         EIyxRBFNia8wRSHMcIl4L3rmc714+ETJhciXrRH3ETR9SP7VGfX0tv5D4JRqccSnnjBX
         oAneIcgTm/T9FFNM58rWPXf9iSNgUbiEftgL52lhelqg5AQfqHVqMZbHCqEbMo1ZSLUX
         sncGZPRveDXIF77CNwMyVDDpUmkC5nfQa+yXWsgln5zAMRel3JtMb56H13c2A3fDiDa1
         /lHaQfUBIFFmmbzl7Oegqgs+5rLV+N3XdM8eVrFR6pFz+IaxzMXaLM+l7m+pOULiAf84
         Zg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530170; x=1795134970;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArOGclM53rFb6FaD30XPdpkN0QKhCsTNqoQPSptCW1M=;
        b=VbLzi2SnBvs/vYXvnRRu+vQoBqD1LH3DIRxvIoLSPit90h78W7B0sgl13EYCyhjZtu
         NzJEKjXlPJ4sXtfCOzbNuFZOKrwGFA8GZzyGVZ7s+NmJLdOE54T0KmTnSixub2VndLa0
         Azh4DGjRFOqrvn0q3qzTAiA/Zr5yLNJgjyCJcxTIaeOOsyg87X9gtpJJxkIx7OTsW+jv
         q4YP8DLvB17RG7TLIsOLATZWIUUDLpwqcnDMJSzadz5W1bFGv3s0sz9A3RkOZWu9vW13
         XB0Tb0euUlt0dWsUGj/aI0q3zHsyb5/i8PAJhJX6kCW3vqEsovdVGZnB+UnfkrAUjjMf
         S9+A==
X-Gm-Message-State: APuU4Z+YhVOHWwTWwnF3nccJa67KsBJJBgEhQVz49iSDJqNIlAjeYl3o
	wonNCtqDP20gv4i+NgQb8kP/hHIoBzo9tKg0dMMinj6B1Py5QRDpMKAk
X-Gm-Gg: AYBFou27PFc6A4Z5yZuyqTgjZ0dYeMCOGOxR4XLyy4rdAedO41ogHT7FbYwUz7A6NGJ
	8kv1vYKJ/dxjt/dvJkUvfVqhWxPEVlP4AosH8eOXRYdVY2bhUGaTI+yV8rdt9ppP7ucr+hOXLGv
	KYhvBf2ZKmyxLmgx4ne7UGwLK3cZ1hYoCUjcukU8qAHTPvjl1O80wuwgnSQMIaYvWtzXgMV1vFa
	LYLAgliVoBBITMldeFrga/BRyvl1wK1LR8r+kYNB2xxVHyoM8C4un2RdN0sNrYMUrsCZbaw8w+7
	zrabtBhzDzVyg736aVHxYBQp3hBnxMF9ugDccOW7puQk/eeh52hUCB1MnqoAtR9mFy2JgPTlJ88
	AU/dZFIjCXosLEaWeuZ5kvXTPR/U1oPSgIxVrjArtY9zgs/V+RqUwiGlpkEIOYJxmZOpPygG2U4
	acWYK4i2H4bav9kqOdv1zY7jEbegNs1jGyz0V1mUHHISAGi6bhXt3H4O5QfAMrKH7c6pJrpziq7
	knvctFFi+8L38t9vzho1Cksohasrp+QF1OHETU29u7tAwCE04LemB4wh2xJip3pSowHqSLTxXiS
	1QY0hCoLiAT4Of2hG3BwfzcUAODd5Byc4Vxxu1aaJqcff1GJbXfS2vZiCrFfR+0JD64MHKydSjK
	YrmhHECdn5z/4vcAVP7F4ScaSni1xjHL0nUn1WjLdbYbwh1exUx6/GVUzuUIBNNV6NjlEUVMJcn
	aJWe1nnI3unOpBuuL5
X-Received: by 2002:a05:6000:4381:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-49c72c9c75emr2405809f8f.50.1794530169802;
        Thu, 12 Nov 2026 16:36:09 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm1918847f8f.46.2026.11.12.16.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:08 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	robh@kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Fri, 13 Nov 2026 00:36:07 +0000
Message-ID: <20261113003607.3662439-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <RqVLVgMZQZCOx29YUhhdJQ@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com> <20261010130024.177503-14-ghahramani.navid@gmail.com> <RqVLVgMZQZCOx29YUhhdJQ@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163611_763177_AA3DD69E 
X-CRM114-Status: GOOD (  15.23  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefan,

Stefan Dösinger wrote:
> If this is a clock control it would be better to write a clock driver that
> manages the crm2 region and exposes a proper clock handle.

That is done since v2. crm2 has its own clock and reset provider and
the PCIe driver uses the clock and reset handles.

> For the phy parts that are part of topcrm: drivers/phy has PCIe PHY drivers.

The PHY setup moved into a PHY driver with #phy-cells on topcrm, so the
PCIe driver doesn't write topcrm registers anymore.

> By and large the zx279128s_pcie_init_crm has a bad code smell: It looks like
> an LLM translation of ZTE's code to me without understanding what the
> registers actually do.

That is fair. There is no public register documentation for this SoC,
so that function followed ZTE's code, and I got part of it wrong.
Agustin found that two of the writes went to the wrong block and had no
effect, see the v2 11/24 thread. For several of the PHY writes I only
have ZTE's values and no explanation yet. I will try to work them out
before the PCIe series, and the patch will say which values are just
copied from ZTE.

Best regards,
Navid

