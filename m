Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E672D606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 22:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zpaf6IEn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mLkKfLHF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HHNRpndje2thNv/HbDv+4nYSQ9Z+lNEwA+f/03fVLQI=; b=zpaf6IEnf73kB6
	kRYRHWHxTGVZAWEeg6Z+M9zc2RN7cLHuniTRvlhKkwbwipRfsi0cr7p60Efb5HYOPGeZDqwTOSiJQ
	EtYJTDLucD42Qi6JsRhaw3qR4wyJQtvVHAcjyLwioFjq0eqe1Pl0qDQ2WgSIE13PDriVja3vE1lL8
	4y5glwbqM8fg/xxkC+FxQ2iUKA3rYkum6pXzxtRUlqdMEOYSdvv+b/js8CWrAQGRrAk5xkjPfwbBY
	C10ViENN6cBLZqr4T70ELEp4q1vTuCqD4lJoUK82thNK2g/1M5/qvHv/7mX4yRlEDTlSCyA9U6XlW
	zCNsYhe2yOuiqXkz9uIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToMf-0000000AQn3-08vR;
	Wed, 18 Nov 2026 22:42:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToMd-0000000AQmu-2Pu4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 22:42:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A63A4640EA;
	Wed, 18 Nov 2026 22:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629A21F000C4;
	Wed, 18 Nov 2026 22:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795041770;
	bh=HHNRpndje2thNv/HbDv+4nYSQ9Z+lNEwA+f/03fVLQI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mLkKfLHFjgX7RvlKDdMp5RkmY7stdgmShBSnCMXR46ZiTWv9HAMdUgi6kt+Vn4ytt
	 myNQ2hjx+4EVw6d064Upkt9KreOijWxKfjnYOeQ8qJQmMykEwqoAK0OJITv35y/HzY
	 yF3i0SOIiSW78K8NumxG69h80av9mU7Al0U2ywZfYNS/Ga9w2amRdXTks4JiKjzOLZ
	 z0x73At0G0p2qyO0064LxvsNYoI/oTyuMra5xAidgZa8/vkkj3zzFCsrzkNQaOVLB6
	 xT7WAscNPDlz5OOR+ESKhLBCvXhEIz7glFJKvU9xZDEjuWlP1dcnW1gRaW7b9tbfPl
	 xfO5kF4gLTX/w==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 5/6] clk: bcm: Add BCMBCA PMB clocks
From: Brian Masney <masneyb@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Ulf Hansson <ulfh@kernel.org>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-pm@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261117-xg6846b-bcmbca-xrdp-reset-v5-5-f584e8b8e696@kernel.org>
References: <20261117-xg6846b-bcmbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org>
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-5-f584e8b8e696@kernel.org>
Date: Wed, 18 Nov 2026 17:42:38 -0500
Message-Id: <179504175827.128823.2420881202230183993.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=446; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=zNBYbYvLU/V+AXPtDXc5SdnQ/xtUGadAKe/E7COsQU8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+aT48ldnfk6K24b30Louc8JDPW82Ml5bNYQh0s12eJ
 f+wzXFNRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABM5e4Lhf506U5rZOb78XDOb
 CSLP3wRydSSvSPbNc4n35z/I41IlxMiw3mHnTdt7zXMWvVQudlwf98h0y5qVhz+JN9Ud3ziDTWM
 iOwA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Add a BCM6846 clock provider for the Power Management Bus (PMB) MFD
> cell. Expose six outputs from each of the RDP and BIU PLLs, the Runner
> clock divided from RDP PLL channel 1, the crystal output, PVTMON and
> block-zone clock gates.
> 
> PVTMON and zone clocks provide gate control only.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Acked-by: Brian Masney <masneyb@kernel.org>

-- 
Brian Masney <masneyb@kernel.org>

