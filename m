Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18947606D803
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cGxsyQVM;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Vk0w86fF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gMBZC7vvaeuxFMqkjuXQps6Bm8Qlu7Ip2L2DaZOXdOM=; b=cGxsyQVMaukOa6xiET1cctPUSX
	vq4BD6Qri8RcBFgb8LpuVXrg/9MBdWr9T/5/rAjmGI+s+Zkianb6ceva8fbh71bzIx+vvXSKm/Nfb
	V7UTIRdv/QHub3kxt6CJ67qCmaUmzNMbuaRA8+uG9UFEo+nzXGhL1hL6BVvqW/E2WUBMcbjK9vr7L
	KwvIGjRMZTvJ+VSXRP0HXEIxclfx0cct6qkw37quqVNXfXL2us4/Sx95ggMrz0Iqrprgg/XiwLRBJ
	qcta4fIWo7p65722l39ptshvpKoJg0B91vU/mlB8S3JbVYzIXwaRDoO518BS0sKUeiBqBbwRsyG9j
	XOWBoJDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ74-00000000uq0-01fg;
	Mon, 09 Nov 2026 14:12:46 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ71-00000000uou-0k0m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 14:12:44 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1b3b4944abeso86566c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 06:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233562; x=1794838362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMBZC7vvaeuxFMqkjuXQps6Bm8Qlu7Ip2L2DaZOXdOM=;
        b=Vk0w86fFNp2MgHUNB/WN4wvtBP5ZJo21nGqRaTRP9bKs9+Hd6RhaK8z82fbELBuBxe
         kzOWeXsBeJ8Fn/vLrFQf0BLR9Bok7DI+XSWPkeFMwrainNq0rlE/7I08KIZZTHChID3q
         VHUNEOoiZnWi6uBRxBdPYtGsvpVV/k9n/K5kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233562; x=1794838362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMBZC7vvaeuxFMqkjuXQps6Bm8Qlu7Ip2L2DaZOXdOM=;
        b=QHfp/pTxTe7Ft1hPsZeh9nfYrrNiI/MeOTNOFoclmkc8x+I828zEOTzzJUhEUQRLbk
         idIjP0QTjDWQLKksuTJb9RR4CROHOq7Ms/8nNRHk7vG29AfOuOztWAaD+L/M2UJRGP0U
         AxchTsMW5Qm2yichC8iMDTBSmGiz2rn3uV6B07f2r3BChiEPfbElPJIPguLsFsx0u+J3
         ihMCeSlCHI2hp7S4gimEXkupZ/Rc2iFKiKFMCR4o5LRcORGFDX63kiTVi1oHWLotVUBy
         +DtPcRMngViWeB17zL0eciAgQUBXsNIsJk85Ztf4jsmUPn8WSBR9WfKVReOqSOuXBU6o
         Oq0Q==
X-Forwarded-Encrypted: i=1; AL+hErHTd6TAbP9SB4OzI4kwO70DxN1WQvWcnqSqE2i6+L5g6NkdVtuYFmvxg5wsmrzclsLgs2Fg6uNva4rMXkv7Vh38@lists.infradead.org
X-Gm-Message-State: APuU4Z8vI2usNn3P3Q0ipWZS460L1X/uwvADR7pAIE3zXRwndvAl48/4
	iY1F25MitDkXu/nxKOA7GBNWS1WfwipsuZqAZjbGGqx01aNII1hWifG/GbY+0p/OUg==
X-Gm-Gg: AYBFou2Z3oYeoU7IWDgUyxCS7M5QwPPYZbhrZi4UW853IBCHG+2qGhWpmQBXNN/DHTY
	V5qbrMJZVg27XI2TiEl/1a7rodT1kVVcukT7H314r0kP4iWt4oEXrrW+rlTtzjqB0iXyhz6e38h
	Rkjld+kWtkdvGe1g7DwANItCNOt3RSQBi3+1/cigR4oRn+DdqcaitrNJaF8Zu0xU4+CHgUZGD9w
	FFQ1/rMzjpPoHUQWshqeY8GTdlFWS+5QXe5z9meqsMZbEwtf3pff4zATKXuzIs2v/WuSPdbTJt5
	P4KNDyy0vKbQcLsB1lS/X4F3sS62clqdXhPzWdWTEizXbAw971fzSoukkNkw0uaUSHK5ntpjNoq
	AzDwA6EXiqs1ZmTTezAN4aAau/PHD/rfmyOL70uAa/T6LFZuicswZvwtnOiNHb61CLB2VbOPkeg
	0lXhFWbcw7i2v/XWsTdkXnSq5Fc8ADzA3OsU5c/WUuZhP37co7ZgDF1IokzMypFG0HxISV6Mqy1
	pneNiRBhXPamqK+Wd72xsGmEqGbuNq8GCpvr1GSzQ0FF8aDb9KMtvBb+XxtBLf+DHTICe95ipv9
	v/e023iY9hl4KaANxjDErQ4K7VB2jhef3Vk9zmOOApqWdtYWoSYGxh0AGMb8J2yerL6EwaNSM6Q
	Tu5GeTw==
X-Received: by 2002:a05:701b:2505:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b39febb929mr6132872c88.33.1794233561859;
        Mon, 09 Nov 2026 06:12:41 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3771ea85bsm14374676c88.18.2026.11.09.06.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:40 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: mediatek: mt8173-elm: regulator cleanup
Date: Mon,  9 Nov 2026 22:12:27 +0800
Message-ID: <20261109141233.983830-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_061243_258946_AC59864E 
X-CRM114-Status: GOOD (  12.10  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series aligns the regulators in the MT8173 Elm / Hana device trees
with the schematics and datasheets.

The comparison and digging through datasheets was mostly done by an
agent. This was an experiment on my end to see if it could understand
schematics and datasheets and help with the tedious process of comparing
all the documents and device tree files. I think the overall results
were pretty good.

With that aside, this is just cleanup. It doesn't affect normal
operation.

Patch 1 removes properties and labels from unused regulators. The nodes
are kept around to fit Linux's behavior: if a node is found, Linux will
consider it well defined (constrained) and turn off unused ones, which
is what we want.

Patch 2 fixes the part name of the secondary regulator IC.

Patch 3 fixes the regulator output names of the secondary regulator IC.

Patch 4 fixes the voltage ranges of the connected outputs on the primary
PMIC.

Patch 5 fixes the voltage ranges of the outputs on the secondary
regulator IC.


Please have a look and merge.


Thanks
ChenYu


Chen-Yu Tsai (5):
  arm64: dts: mediatek: mt8173-elm: Clean up unused MT6397 regulators
  arm64: dts: mediatek: mt8173-elm: Fix DA9212 compatible, node names
    and labels
  arm64: dts: mediatek: mt8173-elm: Fix DA9212 regulator names
  arm64: dts: mediatek: mt8173-elm: Tighten MT6397 regulator voltage
    ranges
  arm64: dts: mediatek: mt8173-elm: Tighten DA9212 regulator voltage
    ranges

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 78 +++++++++-----------
 1 file changed, 34 insertions(+), 44 deletions(-)

-- 
2.56.0.455.g6c5a503b38-goog


