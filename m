Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FBB606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LxAxuF4I;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ETnR0EYS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fxZivtYImLr6Xqc2JRNdVpuAoDBsPDg2LZ9fTboQfSk=; b=LxAxuF4IUPvnCi
	0wG9MtQtiXW4VkGDFoqOjh55ujdnjoLZQai6F4aZKeYtGjOuRLQjr150FMsTGysonGkvrMI57bLcm
	zXLfLOclQBEvPIbUdWU+8f1RP80tZNrP+4of1WlDu0fSzHsTfLIpXpyVl/QqZCcHWEcoLmzoqC5CR
	346spz+CkKrZk/9LmeHJ9K0ViE5PP9xjvL0Fd9cKtAL3RH3LK9+j6w5ejBaivVwtR50iCdxsiIQTz
	wjhx0qiSJM68p3wEGruqv9b8ipmEBIfmNKPdckY5Xvv165UimqDPJz6qobTdT1MElldanQdqIiT48
	bXSVMGxs4TSA70Q/M44w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwRI-0000000E2m6-0bjB;
	Fri, 13 Nov 2026 18:55:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwRG-0000000E2lE-0Xjn;
	Fri, 13 Nov 2026 18:55:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA18341750;
	Fri, 13 Nov 2026 18:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975551F000C4;
	Fri, 13 Nov 2026 18:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596153;
	bh=fxZivtYImLr6Xqc2JRNdVpuAoDBsPDg2LZ9fTboQfSk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ETnR0EYSHanmvts4Apaw29C4gph3To2NBD6sFEiBbcTsQWheycc+uYb/dY++sdp1A
	 ECxfckanNuqbhpUb901h7finwdSVXqd2UuSwmCly7SYG8RD2h+Kil8aDDdTwBRO4bq
	 AD6P4d0nncRlayyXXD8/5UjhW6k3l/xklDvPYdMPyexM9z4+cI705aFdfQil+eTSja
	 TfG2dLTXshnpQFfPjcNCLvourYR4coCrwLa5zYQX+5PaFpcMKAYh+8dJX08boweJCA
	 +y0KSX8VtyWPaWhEB/XouKFIVEe2jI60Q3U9VhHhYDh8sXtZIhtbiVJehwUz0QYuNV
	 kM+WYAcMtqXYA==
From: Lee Jones <lee@kernel.org>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org
In-Reply-To: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-1-9758f38d7053@gmail.com>
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-1-9758f38d7053@gmail.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397:
 describe the RTC's 32 kHz output
Message-Id: <179459615032.87488.12726056214378307165.b4-ty@b4>
Date: Fri, 13 Nov 2026 18:55:50 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 01 Nov 2026 23:33:46 -0600, Ryan Brue wrote:
> The MT6397 RTC drives its 32 kHz clock out of the PMIC, where boards
> use it as the sleep clock of a Wi-Fi/Bluetooth combo chip. The output
> is off unless something turns it on.
> 
> Let the RTC node provide it as a clock.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: mfd: mediatek: mt6397: describe the RTC's 32 kHz output
      commit: e38ddb5cfa9f9dfa7feac202414d7a4192cc24ed

--
Lee Jones [李琼斯]


