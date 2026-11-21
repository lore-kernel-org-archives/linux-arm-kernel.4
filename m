Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F1606A6A3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 04:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gsceyguP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FEMYH5kr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C6CPCEFe3UxyZLZ+8IDnLmwHXl9Q5H7VbT0By79lRUw=; b=gsceyguPVsXwi3y9zVaziWuQVh
	L242ktgikCrNgNpqFpC7WMH0C35SdgzoeYPWkiOqvWUsQYYyVj8kaB2y2rqOia+FgDU2uxlu1P7oe
	xRtjHVHC5hF2iyjBfUtnGsXuorBT/XF/UhxowjQe7iL5eTeSDrnS1j7vbl+eU12W6QZSew06sDHzZ
	xuK0EadDxWL1GM8kQrm2kSDoPyaBLK3WrFtoOxDWxJ3vHqZKg+pgwr80IUJW1FyAO3HnIfXqjGCtY
	bWYQvw38bqydOaAHVWo3tX8Q19j0+aUTCmDIEx6cyMfsxvihvGXa41IFRzGgZ8zJFeI17cFcTTH1E
	/98vP8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUczk-0000000GlOf-1tgQ;
	Sat, 21 Nov 2026 04:46:36 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUczh-0000000GlOM-2SZo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 04:46:35 +0000
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id UZw5xB73Jyb4YUczfxc4Q8; Sat, 21 Nov 2026 04:46:31 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Uczex6UgHdRrRUczexsCEN; Sat, 21 Nov 2026 04:46:31 +0000
X-Authority-Analysis: v=2.4 cv=LOhmQIW9 c=1 sm=1 tr=0 ts=6b012227
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=c92rfblmAAAA:8
 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8 a=t2Qs6IjK45CjxcMyCK4A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=GvGzcOZaWPEFPQC_NcjD:22 a=T3LWEMljR5ZiDmsYVIUa:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C6CPCEFe3UxyZLZ+8IDnLmwHXl9Q5H7VbT0By79lRUw=; b=FEMYH5krfbl0PKHAZtclbWy15P
	UiT+b+oAY88XvU6Kd/jdaLTpAcsYde20rwdTXOH+CnKBEPG96aNRZuTRt/L7QZqYBdB4R4i4yGZzE
	VWwQ0gHJlo1+9HHyRJdp5BujGdsBu3FqOvsV7yheA7o3k401j9Y6P1b5LLgcEQahvr/p9X4f4rx7S
	6Ft8+mXybOAxxvSKqSxyQNSmvSxUw4T0R1As5LrAIZWYj3zNEaWltKpG5JzmdxmMFiLdH69RbJ4iy
	CYqYONnv5WJBIHumipGB+bA61S/z8FJEWsWWbMarwW4EjhKGqS5y+t+MEZQvOeo32512hrR5v2u2l
	17rISX1Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41286 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUczc-00000000sGv-3wYv;
	Sat, 21 Nov 2026 10:16:29 +0530
Date: Fri, 20 Nov 2026 20:46:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v4 07/15] dt-bindings: watchdog: st,stm32-iwdg: add
 access-controllers property
Message-ID: <5f53da81-1478-41fd-8013-c2bc619cb654@roeck-us.net>
References: <20261116132416.1184447-1-antonio.borneo@foss.st.com>
 <20261116132416.1184447-8-antonio.borneo@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116132416.1184447-8-antonio.borneo@foss.st.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUczc-00000000sGv-3wYv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:41286
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 13
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJaiWpP0ZJ824ou4Bsnmp88/1cT3IV9aFFN0J4Nq4w8jFcgH2pdRqlBbLkJovAo7dx1R9qXrsGlvrLGw9tMOvhhve4BgBbgXrvrUs+Whg8i1uv8pCeh/
 yczRDDZqCXpNgCWWXRGQMTPdZOCGUlF6L0e4ih7xPvJouq5Kw93kfVRrzL/br2wFBNaovv3P3e74Ns5jPTxk4OImOH+QfYPzjS4H6vifMcUwIOLXQrSC1irn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_204633_674366_E840C8ED 
X-CRM114-Status: UNSURE (   4.11  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.1 (/)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 02:24:08PM +0100, Antonio Borneo wrote:
> Add the optional access-controllers property to reference one
> domain access controllers protecting the watchdog peripheral.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20261106163429.618392-1-antonio.borneo%40foss.st.com?part=5
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter

