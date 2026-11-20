Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4B60A3809
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RsNMAAqd;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Obxoi06N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P31KX+HGbOZ2m/ze0RQmiiG2ACd7jzLv4I1BkpYMPf4=; b=RsNMAAqdaFFY93wdpxPJTfxAns
	keWbP/xSfnGIBqpFy8mpijYlbo/FQoqe8JhM6u78w3GOssZQCo3fQCzFQEWdyH+zs1iSGm75kcty+
	ux9MxzpBJ04OiswmSNiJbO44oDmXZtonrr3+M4DRtrFlCJLkCEXZoA+c7eSVsEx6bhRIzIZgHryyl
	8EbCt1jJB9cInbu3e8ye8Tj79LSJsYbAjhBxlE+GueUHldveEetYLqtoJcmg1l2cE6GKsQ0ttvRv1
	HUOWeVLe4HLYhZSTq3t5C/odGBvh045mJjwDhR+j3LAhwUl/YvETTaw8YcVQFdAZVu/AghAfkdTcz
	aMqsqFBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMX5-0000000Ek9c-0fZf;
	Fri, 20 Nov 2026 11:11:55 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMVz-0000000Ejeb-2mIw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=P31KX+HGbOZ2m/ze0RQmiiG2ACd7jzLv4I1BkpYMP
	f4=; b=Obxoi06N2BzJC2E18N5zskewr6CRQuDC+9+KvJKyH9LuFwQeHEoRM8iX+
	1RN3g2hi0vRMpw9ChKCggkqpDtldXjWSxbuf15ors+C79EzQrWROtqkODXwVMioz
	AwJzyY5VTdwsnFQspH2hE8RSP1Nhf8/y7hf7KJNOdig+td/U5uqFSxRWdKIjksaV
	xUmXByPF0+tNuh7pm304XaQfgfBSY355NR4ka2paF3JigCsRB5BOfvmbMWMNBP9B
	GnaFo74Vv47qUVK4+9ZpjQSKFC89PuuUA5BL806XF5TI21wlvLZ+P+r6LUjwEDNL
	l86k8NVB2qHZ1u6bkApUglRKLQi7w==
Received: (qmail 1450248 invoked from network); 20 Nov 2026 12:10:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2026 12:10:35 +0100
X-UD-Smtp-Session: l3s3148p1@knAOS7Ng4JIujnuU
Date: Fri, 20 Nov 2026 12:10:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Paul Elder <paul.elder+renesas@ideasonboard.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
Message-ID: <awAqqg6F2Z1t55x2@ninjato>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
 <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_031049_866927_38E50B40 
X-CRM114-Status: GOOD (  11.91  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Clément,

> I don't think SCMI itself introduce instability.
> It only defines the protocol, and each firmware choose its ids.
> Could you tell me what you mean by instability?

Let me try to reword:

In the past, we wanted to support all kinds of firmware. Sadly, each new
firmware introduced different IDs here and there. So, we came up with
some stable IDs ourselves and mapped them to the IDs per firmware. This
is a n:1-mapping of firmware IDs to our stable IDs.

The support for <n> firmware versions got serious opposition from
upstream. We concluded that supporting only the latest firmware will
make most controversial discussion points vanish. So, we now have a
1:1-mapping of (the latest) firmware IDs to our stable IDs.

I guess this is what Geert means with IDs becoming "stable". <n>
firmware versions might return <n> IDs, but supporting only one firmware
we get the same "stable" ID from it.

Sadly, of course, with the next firmware update, we still might get a
different ID all the time. So, not stable in that regard and we still
need the mapping :(

Yes, this means the driver is then tied to a specific firmware version
because it only has this mapping. Not nice for a user. But we didn't see
another way moving things forward for now.

Was this understandable? Geert, did I miss something?

Happy hacking everyone,

   Wolfram


