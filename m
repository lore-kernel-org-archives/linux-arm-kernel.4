Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D57606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 20:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UWm5+4+k;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wd5LR3x5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9fpTTl/wf6AJr6umSE+CPRu2oJNdc9XyyktaSY9PbpY=; b=UWm5+4+kwv78eG
	iTPfVM7XPLCNutjy6X3g8XD6zNVyVGhilSQF6hcZupkONs6sLQvIM/s7qXPQdD4j7CAIBtdEMt06R
	nW5yARaPAJC+6BPbie2iihS+qaPgOtohIOhqc8/wFUTLRsZSGLFusqNAw5bYaduTSOVTKkkKbdh+5
	F5m87gd1NdMkKaG6dLTY4xTFrgqGKSIrjWRPc9qU3H5X7c+h3YE7gjlyfWumtbUB80NxHCCeiwehJ
	kJstPjDirFGr1oyGPHttGD6QAEKphjrD72o+bCkMpoWXgRt/x1MgdR0hyjTBYFaftSeN4XRechZ1j
	Oq/HBCXA6P0U8Xvghcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRb9j-0000000B01T-3kBK;
	Thu, 12 Nov 2026 20:12:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRb9h-0000000B01J-19jC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 20:12:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B206D40749;
	Thu, 12 Nov 2026 20:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBF41F000C4;
	Thu, 12 Nov 2026 20:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794514340;
	bh=9fpTTl/wf6AJr6umSE+CPRu2oJNdc9XyyktaSY9PbpY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Wd5LR3x5Me6L4DjYpH7RjJgvEIUHTnafELJfE4lbU73zmNdBaldXlR3sSNQXDE0rx
	 cpCXv20hOL/iaqJ73OPT+LEExBym1VzA0yKj2SlRFh4FEHhSrCukhXuMSztKOjwdqM
	 zynzj1q6PuePZXVZNMDojDXujpUxwsQcgY1AR23TTvny+9nAq1OxdKf/CLd+CdJuzT
	 3nh0ePxvJMBi9fOqhjY4bt3pPmXbZ7n1OWo63UjkDT4Z7+c5hQwUWZTI8TY85CXaYN
	 RetJuVMppPAVUFs8M7LyohWaw+CDp5DnIt9p++Ndi5cEoOcczjyjweM+CMEQMZ62/o
	 ul+IDIXwa6dSA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] spi: atmel: poll short PIO transfers
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>
Cc: Ryan Wanner <ryan.wanner@microchip.com>, 
 Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112-spi-atmel-poll-short-pio-transfers-v1-1-240ccc868cc3@microchip.com>
References: <20261112-spi-atmel-poll-short-pio-transfers-v1-1-240ccc868cc3@microchip.com>
Date: Thu, 12 Nov 2026 20:12:09 +0000
Message-Id: <179451432977.339049.8591158302502636785.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791; i=broonie@kernel.org;
 h=from:subject:message-id; bh=B3s9LTuJyrYMtGqpBf4YhavMI4ad7zNib44eomiVWMs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+yS4IOTDds4S3tibr5Utl4U1HmcIfSShF+tl5Jdvtj
 HkdPDepo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABMRZmVkmG18l1NKqPvphB+H
 7oVxsDndtLPrunVj5pVtcieOuzsv/MDwPzcgmmXNZXPfWK2G3QGHiz5pMIVnyIfV3fG5dNeTuSW
 eEwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Every PIO transfer enables the controller interrupt and sleeps in
> wait_for_completion_timeout() until the interrupt handler has drained the
> receive data. For a transfer of a few bytes, the interrupt, the
> completion and the two context switches take several times longer than
> the transfer on the wire. Devices that do their register IO over SPI,
> such as SPI attached Ethernet switches, issue one message of a few short
> transfers per register access, so this overhead dominates their register
> access time.

> Busy-wait on the status register instead of enabling the interrupt when
> the transfer is estimated to take less than polling_limit_us, 30 us by
> default, as spi-imx does. The estimate uses the effective clock rate and

How big is the FIFO?

> the word delay. Setting the module parameter to 0 disables polling.

If this is dubious enough to require the module parameter we shouldn't
be doing this.  Most likely it's perfectly sensible and we should just
do it as standard, other drivers don't make this optional.  If we do
have a parameter it needs to be documented.

> @@ -725,6 +736,9 @@ static void atmel_spi_next_xfer_fifo(struct spi_controller *host,
>  
>  	dev_vdbg(host->dev.parent, "atmel_spi_next_xfer_fifo\n");
>  
> +	if (as->poll)
> +		spi_writel(as, IDR, SPI_BIT(RXFTHF) | SPI_BIT(OVRES));

We should ensure there's no interrupt handler running or that could run
in future, especially with PREEMPT_RT which puts everything into a
thread.  If we timed out a transfer then an interrupt could be
delivered while we're polling and try to also process things.  A lock
while updating the flag and checking the flag before doing anything in
the interrupt would probably do the trick.

-- 
Mark Brown <broonie@kernel.org>

