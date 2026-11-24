Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1FD606A6B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cwNexj/P;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=Xg0gjWbS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2ZZ0i6HlDHdHe4CdRACxk5+gA57bus4KuijYTBcB6nE=; b=cwNexj/PpIzzre
	RSzQlauiI6gPHsftJz9QalibIDoK45Rtq7zFIBLXF+v5pOsegFaFVO3YARbDqLPgYdmVb/uDDiPan
	r6OBsr1UpjCWG7ttuF361PoTkJDoBLk77xDhT1b0bTNrpXu6atqko6AO0ZSgx3KIsGXE3u+6sLMUk
	iYWHQa1Dleo8di8HFbTr64AaKXkdmSAmgHgS8XTtjMHfAS2KhzFmSCumVMldyCGxhmml/1GBf8ADj
	vQinQIXqDQtG3piR9B3kGY36HbLzhjm2EmGYKV+hLFiw6i+60/6xv0+s7yAZ+7MiL4Sb5D3ScdMN8
	uxlBj/1JFeAuI28kHusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVy6L-00000007s3p-02Iu;
	Tue, 24 Nov 2026 21:30:57 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVy6H-00000007s1n-2Pa7;
	Tue, 24 Nov 2026 21:30:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795555829; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=gFavRAac8duItiIcuykCC4U61BDDEiC8fP2KB+VUJuuLNRtEiTFH5vHKze6UuNxk3eOL63Wwbetql5b1pbTeENhh9U4bNVFQyggwysLatnKMx6S/2OEVimaIEE1ZHCEHkTvQUnVO28gfLVl6sdEYg5J/NXn5wjqjpd3QqbsmfjI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795555829; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2ZZ0i6HlDHdHe4CdRACxk5+gA57bus4KuijYTBcB6nE=; 
	b=iDo5Tt4apH7dCuqFXUmkAkaL2RlWPK4dG6HvucfGlm3ZZB0yL607G7RFH8Qy3trdPw/dNa5IBzNPbcYthVo+cyLef86+BBPiz9LEHx6CSPGc83xV1qKZZExECgFSSykQdQ9gSDNJztSnyJvuccg5jbomyzle2QhdzX1ugMH6krM=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=Xg0gjWbSOrN3ih4nu1jb8196N6p51fu/BEXKP8u/Rt9ERiF00e1NNOkZCidAxfVQj1WAd+XEnTNTIhf7J0q2Hb1rwIfo/7ZtxrJo2l8QG6CU64eep+f5yKCQTTofb+0GcULk/4UpgZehAdaGO9pFh0FJZZR41XaDUwZewmqxGFw=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=2ZZ0i6HlDHdHe4CdRACxk5+gA57bus4KuijYTBcB6nE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795555827111698.0393064779806;
	Tue, 24 Nov 2026 22:30:27 +0100 (CET)
Date: Tue, 24 Nov 2026 23:30:25 +0200
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
Message-ID: <20261124-re-martin-g12a-mux-t7@iav.lv>
In-Reply-To: <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com>
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
 <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_133053_899173_B221A122 
X-CRM114-Status: GOOD (  13.96  )
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

On Tue, Nov 24, 2026 at 9:50 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> I have just reviewed Lucas patch [0] which adds Ethernet support for the T7 SoC.
> He kept the internal MDIO mux path disabled by default, so boards
> using it will have to enable it.
> Have you tested that approach as well? If not: it would be great if
> you could investigate the pros/cons of your approach vs. Lucas'
> approach.

Not on hardware. By the code it works: mdio-mux registers only the
available child buses, and the g12a driver writes CNTL2 only from
switch_fn. With int_mdio disabled the internal bus never exists, so
CNTL2 only ever gets the external setting.

But that avoids the bug rather than fixes it. The MDIO source and the
data path are separate CNTL2 bits; the driver switched them together.
Disabling int_mdio only keeps that path from running, and only on
boards whose DT does it. The G12A/G12B/SM1/S4/C3 dtsi enable int_mdio,
and ten boards use the internal PHY relying on that. Changing the
default touches all of them, and existing DTBs keep the bug.

The driver change removes the coupling: the data path follows the PHY
the MAC attaches, with any DTB. For a new SoC like T7, int_mdio
disabled in the dtsi is ordinary DT practice, and the two combine. If
one has to pick, the driver change: it fixes the cause.

Igor

