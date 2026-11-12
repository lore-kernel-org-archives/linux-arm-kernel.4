Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1053606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FyENfB15;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZrKInB/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3r3YK91+4doEhazd+Tla/QmKvzSykFfCA7OhTKV88Mc=; b=FyENfB15y6vuhNTpJgoa+Y5ES8
	wOJFU3SBoFh6gdynF9KZPE+u8Q3B3LH2ZguIAXvbRvYO3N+Sm1QxrNFZbYM6s4fOJ6f6Vl551rFfV
	FIt+3BBuG9f9OGMwbBysnqTiysio5sY1R93mQCWwlOFH7lcVPE2JH+PSHucLzpMdfLnq5/Pr76nvr
	y1l/C3McZ3qVLF58R5rg9OYA6hA4tdOMmZcoFIM3WWq3mSGyTgS29Fikvml9m7Vdo8pBo/k7PTOCo
	xgvwmHiYDwchEeYfNB+Ifau21APMRZT8+aynh0vXVvUIfcjLGmlL3YeKY7BnpgX6Wh5NLz4VWanLZ
	DxlTt0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVUB-0000000ACFr-4162;
	Thu, 12 Nov 2026 14:09:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRVUB-0000000ACFa-0ijY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 14:09:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46B3840840;
	Thu, 12 Nov 2026 14:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82231F00A05;
	Thu, 12 Nov 2026 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492545;
	bh=3r3YK91+4doEhazd+Tla/QmKvzSykFfCA7OhTKV88Mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jZrKInB/dw9y7sshA7jXo61/laxLjxtNTGogkJSw4mbYJdGM5Z0lvvgBXztPKXOMU
	 h2cDV1ssFEl1HHKGRP5V45NJEAA3j+/Oxd6QEmEtEtFnk4uPGaArZBYLUvOV6FwD3g
	 JdAj9NqyACwoZDbUYb50924lD3+tZmdiDWSTVHLqGKd/MHfSaVUFBYGThoEvNHy28o
	 cHfsQ5hddnsnmcw/Diuopv9jRDmWXkMOKk4H3DQmBZ2eUq7gJYa6KceOqCmYSLzmKo
	 sHYzZHqfPMPcRdKrOkmAWdZuYgoH7uhzzuVTZ3eoWbgq/6ral1ujjDn0am+NHOY+2r
	 fEJq2rZC0QjJQ==
Date: Thu, 12 Nov 2026 08:09:02 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: jbrunet+clk@baylibre.com, p.zabel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	michal.simek@amd.com, conor+dt@kernel.org, bmasney+clk@redhat.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: clock: convert zynq-7000.txt to yaml
Message-ID: <179449254210.403147.12378067448658354620.robh@kernel.org>
References: <20261111150812.1874449-1-radhey.shyam.pandey@amd.com>
 <20261111150812.1874449-3-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111150812.1874449-3-radhey.shyam.pandey@amd.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 11 Nov 2026 20:38:12 +0530, Radhey Shyam Pandey wrote:
> Convert the Zynq 7000 clock controller binding to DT schema format.
> 
> ps-clk-frequency becomes optional with a documented 33 MHz default. The
> text version listed it as required, but zynq-7000.dtsi does not set it
> and five in-tree boards (zynq-cc108 and zynq-zc770-xm010 through xm013)
> never override it, so requiring it would reject device trees that are
> already in use.
> 
> trace_emio_clk is added to the clock inputs. It is the external trace
> clock feeding the debug trace mux, which the text version never listed.
> The example is corrected the same way: it used can_mio_clk_23, which
> does not match the mio_clk_XX form this binding defines for an EMIO
> clock on a MIO pin.
> 
> clock-output-names is enumerated as 48 const entries instead of the
> prose "shall be a list of the outputs below", so the names and their
> order are now checked. The clock cell is an index into that list.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  .../bindings/clock/xlnx,ps7-clkc.yaml         | 145 ++++++++++++++++++
>  .../devicetree/bindings/clock/zynq-7000.txt   | 110 -------------
>  2 files changed, 145 insertions(+), 110 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,ps7-clkc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/zynq-7000.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


