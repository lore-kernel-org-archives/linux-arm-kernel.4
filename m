Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90619606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=07I0XCzb;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tvnr+SFq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g7MlRucj6hzoIqlqipb4GtdWwD9O/OEsZ9EcZBH/LpA=; b=07I0XCzbtqDjfa
	1EqqbqDX+YHAKOK/NDEaiy6OoFBrwl/8Wi9RYQovxEWR/3kMi+9mIiULMpy4U2ecS3go9M/vGJqcP
	NlmjW7UcXSIjwQVRateFKKaCT8vFzjmJEUbW/zOMT8R1b0Vi6y7fMcU2FwO2AtKfuzEG3xO6Y4zxu
	6tHLUvmwnsHLKnJr4Q0UV1gpB4iZL/+VuK/FbT7wgRYAwI2K35ReFtMHmeUkfEGdaohMkYkNVqWHb
	5tDp4d7GarlcKc2REOC0xxVPQHvU9zWpkdo2LzVUjosSNdfjjuzbC7rtXFfJ1d6OhgmUsAw7yOXyY
	rpEUQ/yulUhj0kk//DAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNZ-00000005yHE-1bLB;
	Tue, 17 Nov 2026 13:37:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJNT-00000005y9C-0BGu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:37:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8280EC4CBCD;
	Tue, 17 Nov 2026 13:37:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18F5F5FC81;
	Tue, 17 Nov 2026 13:37:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D972411BC0036;
	Tue, 17 Nov 2026 14:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g7MlRucj6hzoIqlqipb4GtdWwD9O/OEsZ9EcZBH/LpA=;
	b=tvnr+SFqz0ANaFeOIu2h7eLOvHj0EZWnuxud/WDxtHQ4Zpt3cbqbm0d0jztVWnscm1UMlA
	6El1kdJKO4OWPwf29oO6VWr6RwMA0BDppRnjq6DbpEiRDD0POTTkPdWuMbNuGEMMkTms69
	F9PrzKH+Mku9uLcsm/+nrLcGJsOjmCtSWpkbVNpOnNcwo7OKLGRfgQdKcbfQvJPgkBF864
	Qdm5JjcTNXrCchaBQvHMRdc/d90o1TykSneuOr/g2msMi3m2zedQxbpJe5ih6BWsoLzVaY
	bcdGbL1lqC8Tl5C4w8G0TZW19BOawLDSFtFLDcfwEBBcHbJsCABk8n5Y70RNPg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Richard Weinberger <richard@nod.at>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Han Xu <han.xu@nxp.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rosen Penev <rosenp@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Wentao Liang <vulab@iscas.ac.cn>, "Rob Herring (Arm)" <robh@kernel.org>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, Chen Ni <nichen@iscas.ac.cn>, 
 Runyu Xiao <runyu.xiao@seu.edu.cn>, Hemanth Selam <hemanth.selam@gmail.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Triet Hoang <triet.hoang.dev@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, vkoul@kernel.org
In-Reply-To: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
References: <20261102181406.3994422-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] mtd: use dmaengine_desc_set_callback()
Message-Id: <179492264476.2237190.6242832755498248346.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053739_285792_5FAA0522 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 13:13:41 -0500, Frank.Li@oss.nxp.com wrote:
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across sound drivers.
> 
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: use dmaengine_desc_set_callback()
      commit: dcfabf5f3939e02d344890fe4879d8488b93890c

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


