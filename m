Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C341E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ca3Btdhf;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TnBm/QP9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ovt3whWqdaT1jywj9I1uBt0fMRtj7mzqaOeqp3btgZw=; b=ca3BtdhfunFgUXJwj+wtIvmAN7
	c6HoIocAsYbeP0Sbz7ImSvkfOJyIdRY8dPY/S6lhUa9VUFaU3B/EbdHqwUjlL3Y5B52qEPtpiFk9s
	NpVWuyBfO+Ye+U6GVqRYHLKWX5xjzpuiV0m2t8yjUV6yD0OqKUpN7l3teVDuxgwEPW6Xge+8Vf/pP
	JU6hVHRVu4Nnee2nIFGgZK4JA+GxpiNSqtvhPUV39dj9jZXtCTxNmcs2vKtuuYEbFYqJ9MWt92BLU
	/GEGarSnhPIi6CG/VjEdYLyFWKOFYSBtgSOhuftCS4KN52MCo3VBsIKG5QClvD3PNkfAfbCOD/5oU
	5lvuna7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJCd-00000000p0x-2IOK;
	Sat, 28 Nov 2026 14:14:59 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJCb-00000000p0L-2sld
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 14:14:59 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-386ab9ab619so12797756eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 06:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795875296; x=1796480096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovt3whWqdaT1jywj9I1uBt0fMRtj7mzqaOeqp3btgZw=;
        b=TnBm/QP9G1KLIpw9xeAa3KObFh0V9htzQQnUZi+v53EBoT4W412ahI71Gb65Jb6bjG
         nNYNzo7M9uVfAFWfDGATCmKCuKk1owR6TOSALTy6FQ9N04rqbJRfM+wS1aQCyPcb8WTh
         WN7xsC+sWMQD464yM757GHyl0bc8Z+/+ISN/FjI6Iv2kXpw6Y2PHy77EzHnEfwJh7E17
         wRqyoczz4SbIoaYx5dwUS5KNadG8S8Mm+rvuqx4kKeXAxVPyCt+ptdDEUuS1eXjNGjc3
         rydMlhJuvbb/SXqvTAf+BkXHpPQniNe6jYD9RLboJKYvyAHsrye7aulEr8pbORhqTmUV
         N0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795875296; x=1796480096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovt3whWqdaT1jywj9I1uBt0fMRtj7mzqaOeqp3btgZw=;
        b=PyQoRH0N4SJ2hJf95gyt2tY5imopMrObo9m79XKQumEWkEA6exupJzF+kaR4TYSID1
         PMHlz/7rwUFdWY6JwRl+JB5FU8+WQ2ctzdfBJOSJJrYK8PDA+rcmAZCiduWf8o7JsgZX
         AirAWP4urgSDfLxQXqtyyeUJOHDWnqz+NZDWyxmPhjaHhuv8Yeb/QSjciJKJ2kbGaA2R
         aOJgp/eYH6Mt+EFTY8Q7e7ZTWNNqqW4oo+aa1wWnEV7/273tZuSBRWN3Xi0fBPz9KEnQ
         K5aiFBuvWsstIA0clrkXwgjm3gx6T2MWldnfGLabRIcL6A8ji+ERANAof25jIKRjHIen
         d/5Q==
X-Forwarded-Encrypted: i=1; AL+hErFUJ1t4HPRuw+4pq5f15iB93p/DlhATxqT9FzIRl8iXhLhhS+G3bfA9BusUZfUc6JpYbMaGtr4pNuUOMHY3WA/d@lists.infradead.org
X-Gm-Message-State: APuU4Z8WRI05waYMISE4AJ8o1oaoHLkVFxCJ5Oae968lMrRTAREHiRCw
	kBD0z3yLbW9jH/h9q+uFIOyU5OxDrZcFcGjMNblkGmw9OwBx8Qip0KDs
X-Gm-Gg: AZFdTZfpGZHBKAjK2qG/2Z3CRgGQa/TtE8WXAXSKcexQITLBwTlzQ+o+fiHWptDXP5U
	jl/iaFYXqphehXBDM6tdvYQGuwxHsvar8Cy+I+xIelthYNDbO6HJ+RUi8vCSXsPPplVsgPFs1El
	M+ebbSgs9u1+Pc9gIxJkRrhgG5uO+3yI9PZ/k4Tzgnzs0YTGkWGpucCzdNo2k14cctf5Xl5HOxu
	tiP1bjddG59IX2n9kJHKcR1LLn13XdaZQ0qTVo/muS1SUxnhPWcoWwPa//ab1eBKn1cmIQmuhEi
	GShM6HzPZzEeKokttQrsuHIh0qREqjL4DbmXMArth4CUqS31apTfB2plRmfzbGo77PRZFdG403r
	qLJkhUD21HURhU4jQJ4JaenTh+qm1Bd3ZpmUySQG9L/8g1enk+azw2UulCBBUGcZHoFU244SRaG
	kRU+S/rUlKQoWtEMSkRhKQw8g8a6wZd4sSmHWzzuv9cG7ghmAysvyylKoc6ZFgdfFqq6c4Bvm3l
	WL2t/7Bs83/3LKpYynef7Wd5ggu6kvBIYu/TuBbfxNm30ZU1FHfPa0cRaj6UqCbKpBFXGrJjag7
	BN6UQg4Jes5ndSA0epSODK5FhZZN2QAyPsPljyRU9ZmUX9H0svX7V9hcxgZpD0ZgCWla79Rb5Lx
	8+KimJf0rKT+jwVePFi/lXroUG4Mx
X-Received: by 2002:a05:693c:6010:b0:385:849b:7899 with SMTP id 5a478bee46e88-385849b7adamr31917186eec.4.1795875295880;
        Sat, 28 Nov 2026 06:14:55 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm87185893eec.6.2026.11.28.06.14.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 06:14:55 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Leilk Liu <leilk.liu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH 0/6]  arm64: dts: mediatek: Add MT8189 Skywalker based Tarkin Chromebook
Date: Sat, 28 Nov 2026 19:44:24 +0530
Message-ID: <20261128141443.13065-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_061457_748782_8CBB51C9 
X-CRM114-Status: GOOD (  15.11  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial support for Tarkin, an ASUS Chromebook (CM1405,
CM1406) on Google's MT8189 (Kompanio 540) Skywalker platform.

It builds on the MT8189 base support from the Genio 520/720-EVK series
and adds:

 - an MT8189 compatible to the MediaTek SPI binding (same IPM design as
   MT6991) and the six SPI controllers in mt8189.dtsi, needed for the
   EC on SPI0
 - a label for the MT8189 watchdog, so Chromebooks can disable its
   external reset like Geralt and Cherry do
 - the Tarkin board compatible
 - the Skywalker platform dtsi and the Tarkin board dts
 - Tarkin in the ChromeOS hardware prober, for its second source
   trackpad

- Tested on an ASUS Chromebook CM1405

Not included yet, since the SoC side is not upstream: display, GPU,
audio, USB, UFS and PCIe.

The Skywalker and Tarkin device trees are based on the ChromeOS kernel's
mt8189-skywalker.dtsi and mt8189-skywalker-tarkin.dts.

This series depends on the Genio 520/720-EVK series [1], which adds
mt8189.dtsi, and on what that series depends on:

 - MT8189 system and base clock controllers v6 [2], applied to
   v7.4-next/clk
 - net/stmmac: Add Mediatek MT8189 support, v5 applied to net-next
 - the MT8189 pinmux header [3] and timer binding [4], still pending

[1] https://lore.kernel.org/linux-mediatek/20260924-add-mediatek-genio-520-720-evk-v3-0-2ec5c80677d4@collabora.com/
[2] https://lore.kernel.org/linux-mediatek/20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com/
[3] https://lore.kernel.org/linux-mediatek/20251205064357.13591-1-ot_cathy.xu@mediatek.com/
[4] https://lore.kernel.org/linux-mediatek/20250825033136.7705-1-zhanzhan.ge@mediatek.com/

Aryan Sinha (6):
  dt-bindings: spi: mediatek,spi-mt65xx: Add MT8189
  arm64: dts: mediatek: mt8189: Add SPI controllers
  arm64: dts: mediatek: mt8189: Add watchdog label
  dt-bindings: arm: mediatek: Add Google Tarkin
  arm64: dts: mediatek: Add MT8189 Skywalker platform based Tarkin
  platform/chrome: of_hw_prober: Support trackpad probing on Tarkin

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 .../bindings/spi/mediatek,spi-mt65xx.yaml     |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt8189-skywalker-tarkin.dts  |  62 +++
 .../boot/dts/mediatek/mt8189-skywalker.dtsi   | 453 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8189.dtsi      |  86 +++-
 .../platform/chrome/chromeos_of_hw_prober.c   |   4 +
 7 files changed, 610 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-skywalker-tarkin.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-skywalker.dtsi


base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
prerequisite-patch-id: 7aeee7d452186b3bc1c11722b7ddb7dfbae7d396
prerequisite-patch-id: 7f2d960cde2f0e0a307721150e83b7b05b9a60d7
prerequisite-patch-id: f383e7157010179243963badff8c663d0ca21592
prerequisite-patch-id: 742dfe3c56d88bad5dbdae49b34ecf8639db1bdb
prerequisite-patch-id: 9c9c64b8b3879f230ba18a0d11cbeb584ce2977c
prerequisite-patch-id: 7b1af194800ee6075aeb7933e2b55ac57e1dc5e2
prerequisite-patch-id: 8c8e59354c22f2fa141599efaddc1d28da97c910
prerequisite-patch-id: 560ea66d94464ee05a72499d1bd8adb3830fe9d0
prerequisite-patch-id: def65116008ad75bae741bacc67552227446449d
prerequisite-patch-id: 226e61bec983c3cdd39a64d0b5aa64994c6873c4
prerequisite-patch-id: 988df54e8bb41d0cc56104398da9c8f669eef878
prerequisite-patch-id: 9a3f954e6efaed40f57a23e721505f5e2abf538e
prerequisite-patch-id: ac2ae94b727d7e4f2576601e09ed481248e6c099
prerequisite-patch-id: 5cf430a386ebd823b14ad79aa05e8b723510f2e8
prerequisite-patch-id: 49a0b4ca405cfbc9854dea09df664f60c7467fb9
prerequisite-patch-id: 998d0587e6bb0ee244afeb5344cd3e9438d933ca
prerequisite-patch-id: c23a23ce86063191e84218c496151104c270bead
prerequisite-patch-id: 9c596a2b6b48b1c646e2aa6fdb12c2fc853f44f2
prerequisite-patch-id: f0978bcc3be8c1986a00e41aab540c911508ae07
prerequisite-patch-id: 8ce69ea826d8ebdb9103dab20941b018a10ef230
prerequisite-patch-id: 7f544c1d5400bb2f6e964f53eeaacb52878bfce9
prerequisite-patch-id: e2027aa2ac9d98bc9bc577dc0ef5bcb664380c51
prerequisite-patch-id: 29b5901b08e6c967da57d83d90fdcac50657e4ad
prerequisite-patch-id: 4442d5bd4b04a393301f974a3aaeabef7a693aac
prerequisite-patch-id: c6be163e56e8187c47e4ee6adbab4c7877b5b5e9
prerequisite-patch-id: 12f43414850b4a72ba37967ff7f765e426abd9e5
prerequisite-patch-id: 9b00d856ced9bea88911a5af4d5e5dd003e66b15
prerequisite-patch-id: 967e506aa16b20c211cb74080f83e38a7dffecd1
prerequisite-patch-id: 2943831ea7bc0c4075580adf69e033f9057f4b19
prerequisite-patch-id: cedfd27a6d86ef771ea29570d7aeaa1de6700d76
prerequisite-patch-id: d71281b728b70a0c3e6628fcf667df5fce81f2de
prerequisite-patch-id: f08f0f9abf6ddb4856e6f83f09afbd9a6bd58c69
prerequisite-patch-id: 547ff4e2a908f87e94fff37f8e0a5cd7b6a06deb
prerequisite-patch-id: 3b288113483ca2c4181fcc1141f03c4dfc05c43e
prerequisite-patch-id: a7497035d432d4454a9e9ddf09b4dbef89a060ed
prerequisite-patch-id: 26b2574fc9d0ead6e8ab193fca387cf6e816dce4
prerequisite-patch-id: 29c372cf76fc379b8fbc48a1418ab7be81fc9a72
prerequisite-patch-id: cbb095d95655a5f03ec66e163313544cb6f684ef
prerequisite-patch-id: 85b0f64a1f172ffb61a5c2f1f312c6e1b9413162
prerequisite-patch-id: e72c5ab13c8fd89d6ccb022ce6c8d6ebc9400a3b
-- 
2.46.0


