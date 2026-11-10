Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAFE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rpvTdGG6;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=QYXnx+aS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KwOMqReEGh0Ih1HTKwwC8fhh61cTvDF88ZgrH8p/zw0=; b=rpvTdGG691+4CudPStbjb7PYVp
	DRAxwVvGxmo5iENJcCTrzh5454D+gtzmukQhgeFS026P56L3FdyJ6Y25ur5xLf8oivi5wdQHGa1K0
	jXK+N6kFq1b7EZVYKjfWNOSYyk7jRsWfKEAiAVc8WOTIrtJHGNCitqY4g8CmdDy480KbxUQ6x6cvk
	TKI20Mlk3VP49J7YuAaaeCdKJ9s+344VwuSj+GJTAnIAYIYuVWMp0fklqD3+3NAH0g5bM0YyknWm6
	oX/yKRgy2rH3BHJ7mLaZK3xbfUJ0QGvp2R4TH/Xy1i1nibRN92eXube/4BZ4siDn1uEzsBUnrq0Ud
	yer74L7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjlf-00000003afg-350w;
	Tue, 10 Nov 2026 11:11:59 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjlc-00000003ae1-29lf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KwOM
	qReEGh0Ih1HTKwwC8fhh61cTvDF88ZgrH8p/zw0=; b=QYXnx+aSkafOzcSvfg84
	+n0fhAQDf3znURYRalx2f6M7bcGzQ1rO+qluar0Ep4W2h6OFl8gOwAewJx0+Pan3
	dPMe1MxRPZ7GptCOkWB1qxv3al+97t/CtWcAQd2rwNK4SN31coneVoF7c4Adg3Yt
	gjPiWxmJyiCiFCkRcntx1RMZz0fGxk07DTTb4IAKaA7cT1NrtdjpMpnEl3n9yj75
	TXCQEDCNmNc4ZChAPy/JbPan56r3xGYqrQEs4/6b+bgCYhCzmpY7L5AvzDCfczxV
	v/NUt5zgVO5JIccXDh7wM/ajsOEbKxNgEWYNGFRUPkrAGbfokTDlSZfJf19fcT6O
	Zg==
Received: (qmail 205390 invoked from network); 10 Nov 2026 12:11:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 12:11:54 +0100
X-UD-Smtp-Session: l3s3148p1@u8pgJepf4p8ujnsO
Date: Tue, 10 Nov 2026 12:11:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek
 SoC
Message-ID: <avL7-gfNNvO0s_gw@shikoro>
References: <20261103210542.15965-1-ansuelsmth@gmail.com>
 <20261103210542.15965-2-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103210542.15965-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_031157_107162_D04FBD66 
X-CRM114-Status: GOOD (  10.57  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 10:05:41PM +0100, Christian Marangi wrote:
> The same I2C driver is also used for Airoha SoC with the only difference
> that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.
> 
> Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
> Mediatek SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Will apply it to my for-andi branch.


