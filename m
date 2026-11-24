Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C86A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZCfAp4U5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=bLuAcqiy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+7yriBQmp4Pyg6LBithbao3yq/ei5DDnd+Y7B6DQccw=; b=ZCfAp4U5Oici7L
	disvFHpTu0bRFdTu1BrqTK11WI7f5LXnAke3Z0wVz86o3OzGHiLjw4P/mHQWmdvmjtec3Cb08UIg2
	ooMcW3e+oxEf0BTb/cNdBqvbGe12HPvpRCzWeZyevSsdB2Ctv63Ex6LRLuERjfEzzFcKDSDd5C1Kp
	Qh/xlHaKeeZPKirYSeejfg5IQGrCXqjRrv9/1DttZqIbpkoGL/VPJYuC32rbAZpiH1CKQ0OoGmM48
	QoANNn3HvaAvqhYK8vW1ugdTLcWlMmizWbOYOwRyj4BhXQF8j3Xr4YuPVhoFzumwGBbD3T4dx7duI
	XoVAbmV5aEj/PPA9PoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVz8A-000000080QO-348M;
	Tue, 24 Nov 2026 22:36:54 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVz87-000000080Pv-0G1i;
	Tue, 24 Nov 2026 22:36:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795559795; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=ewXRmMb/grqcXCqyajSzPlfeA/UDX7AMuaxljNmoIbgYjL/stoOVXyeBBylOGTuOruUI9LiFvufhL7vImnTZSuGrM69X45WAvVEw7Bocwd5nz/OWlroGXNWNb7BBDN2pxa+LHxAog2ZkivD/fjX/XsFGPMu6rVRj6XSL9Mkkqtw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795559795; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+7yriBQmp4Pyg6LBithbao3yq/ei5DDnd+Y7B6DQccw=; 
	b=cKHptoyaaTagkSHXihPzIdff/Uc4akXknMvBVW7tuUk0MB9Izpmv2t9Jf/2BeCs7UjpyTtY0WGcfCF+fX95BQUVEg0SUh2tIO7+xeWLZ6F/fCTTREI0OHGjSPcUg7PiTyHkO+NWSxN+0LcTs7CJ7tcpK0AuW/Owamz3/44Qv7jc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=bLuAcqiyejhD8ctiq+ItIKKiQyQISUabktWt5nEuDtTsq2FG8y0JqEBT9OuvSz0+reHdkXBXZQTdcSRa5c+ofBV+xuFYIOrfugTunuIb4RAkfvvCo1BZbh5rJxWS5mqBqm0XuQp2M54mC9kg9wREqicEJuTWDPeDl+RcUcR9oyg=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=+7yriBQmp4Pyg6LBithbao3yq/ei5DDnd+Y7B6DQccw=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795559793494282.3032309807419;
	Tue, 24 Nov 2026 23:36:33 +0100 (CET)
Date: Wed, 25 Nov 2026 00:36:32 +0200
From: Igor Velkov <iav@iav.lv>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Lucas Tanure <tanure@linux.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 iav@iav.lv
Subject: Re: [PATCH net v2] net: mdio: mux-meson-g12a: keep the MAC data path when switching MDIO
Message-ID: <20261125-re-martin-g12a-mux-cleaner-plan@iav.lv>
In-Reply-To: <CAFBinCB3auaxcJ4wV+Q-KS4hBKfacrPpu_X9BAVBirAuMNbDvw@mail.gmail.com>
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
 <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com>
 <20261124-re-martin-g12a-mux-t7@iav.lv>
 <CAFBinCB3auaxcJ4wV+Q-KS4hBKfacrPpu_X9BAVBirAuMNbDvw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_143651_413223_28ED443C 
X-CRM114-Status: GOOD (  10.09  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Martin,

On Tue, Nov 24, 2026 at 10:52 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> What caught my eye is that the code now reads strange: we have a mux
> that we're following for half of the register values while another
> part is fixed at probe time.

A cleaner plan, for the record: set the data path once at probe from
the board (USE_INTERNAL, RX_CLK_EPHY, and the ephy PLL when the MAC
uses the internal PHY), and let switch_fn flip only SMI_SRC_MAC. That
also covers the reverse case: today an access to the external bus
writes CNTL2 = 0 and stops the PLL, which would cut a MAC on the
internal PHY. No in-tree board triggers it: their ext_mdio is empty.

I did not do it that way: my boards (ODROID-HC4, N2) all use an
external PHY, so I cannot test the internal PHY side, and these boards
needed the fix. If someone has a board with the internal PHY, that
version can be tried.

Igor

