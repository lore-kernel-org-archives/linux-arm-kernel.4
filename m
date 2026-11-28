Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB77606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KRyJpR99
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0SgVYpy3U1JTUre4VHytz/rdMzMvnSOCjF5XdP7a+hw=; b=KRyJpR99UOy0jTYu4WQJI/2CB1
	4LyOPYodO4Oj4/KRCAe0ehUExvX5EMGyoJxoL1kSR8NFpOYIOaEqI6t/fQPOIIBvyjpiQf3QKFFv+
	F+PzaNiPATaIk5s1LBf+ZnKfpnjSkEDfoja0AJmN34OeBSFrXsZcFi8rfA1HTWWGaBPXLyA4yGeZB
	XF2NDUPc9ajOhiJ3TXwABW71tjOnBME2baEE0xakERetSwVWsL8ttcqiO6E8lxmdv2edoQ4BTyhoB
	ZF8SS8qctTt6UERsx7XwOKgMBUxLIEKz9Eq2AD6jHvTPj1O/GzsOwqtcpwAm4wdUI5EPCYCYLPA9O
	dHjlp/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJu9-00000000szD-0Ze4;
	Sat, 28 Nov 2026 14:59:57 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJu6-00000000syq-3bas
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 14:59:55 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xXJu1-000000003e5-20pg;
	Sat, 28 Nov 2026 14:59:49 +0000
Date: Sat, 28 Nov 2026 14:59:45 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: andre.przywara@arm.com, jernej.skrabec@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
	samuel@sholland.org, Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Message-ID: <awrsYdpvQe15l8KX@makrotopia.org>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
 <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
 <9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com>
 <20261127-a733-dt-v6-01-reply@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127-a733-dt-v6-01-reply@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_065954_901006_49B72AB6 
X-CRM114-Status: UNSURE (   9.99  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Enzo,

On Fri, Nov 27, 2026 at 01:06:50PM -0500, Enzo Adriano wrote:
> Jernej, if your "emmc" meant SMHC2, I can also drop the unused mmc2
> node; no board enables it.

Please keep it. The Xunlong Orange Pi 4 Pro has an eMMC module socket
on SMHC2. Alastair's posted board file does not enable it yet, but
the socket needs &mmc2 (8 bit, HS200 at 1.8 V, hardware reset), so
that board would be a user soon after yours.

While at it, the mmc2 pin group misses two signals the eMMC socket
uses: the data strobe on PC0 and the reset output on PC1, both
function 3 like the other MMC2 pins:

	mmc2_pins: mmc2-pins {
		pins = "PC0", "PC1", "PC5", "PC6", "PC8", "PC9",
		       "PC10", "PC11", "PC13", "PC14", "PC15", "PC16";
		function = "mmc2";
		...
	};

Without PC1 the hardware reset (cap-mmc-hw-reset) has no effect, and
without PC0 HS400 cannot work. On the Orange Pi 4 Pro the host
controller probes with this node and the pin group above; I have only
checked it with no module plugged, so I cannot report a card test yet.

For transparency: an LLM coding assistant helped with the analysis and
with drafting this reply. I personally review every line before
submission and test manually on the hardware.

Cheers,
Daniel

