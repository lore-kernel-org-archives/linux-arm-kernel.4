Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CuzCQ9hd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J4kQvRYX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H19bC14P+Fq0u7h+LnbIUXQzZu545dObmgwVSvQDwYk=; b=CuzCQ9hd4BSUW5oFs2WUTYelyH
	CohhCc1DHxNGw9T/tmThMsbiyGIgYnZ9ifjCuz9n4baJIz0WJpCAD9Oxdl4uZ+AXOBGH1hJQa/J04
	5aB3b02XCxB5OHoVl7wcJ5jsnwWqSTuKxvX2Wx2Jqff1gIlnqBg1rGuEmPdg5st0yH6E3xIKwCf8A
	djFmMaTj9+DZa9JoDka32rRTzHUF643Kg/Kcr/FZdYr/AjclUi9zaKk4dMk7wupkbI/+E7KMHyMaU
	WjthvUV4ZhBuUwJeQTOnJ53itappl3+m6PHJj6jAXyR4ml96HFqCDkgG0EXLXqvOD/kadQxfWFRRg
	a+IGT5oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT3S-00000003KzW-39BJ;
	Mon, 23 Nov 2026 12:21:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVT3R-00000003KzM-2lDk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:21:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B4A86620AE;
	Mon, 23 Nov 2026 12:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E231A1F000CA;
	Mon, 23 Nov 2026 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436511;
	bh=H19bC14P+Fq0u7h+LnbIUXQzZu545dObmgwVSvQDwYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J4kQvRYX4cRJlYBYPvV8UCcRw4CY4NWRq6I8ePpPztgvlHI9Iu7p7qJZrv/My7+n4
	 L91EOq0AWHZd+NLIJyF5x6QeNvdznETlVLTwYvb9h/b5A41kfXiyc6f7ol/mImR7Mv
	 P6xjZbOpB2ZmUcIPMY79LBfhZ1QPh5mPEyMh6tDtvAsuzeZ/CXZ8NjXr4yKnqJIXPP
	 HP6Yw+3mDXfqAA3YsGtyFtAT19VOvwLj377rbOtFZoFVMRxoCMaobc2VUAegG7lQ0u
	 uZuXg/w4vhuJv1JWvWGvTsGz2tA5+DMnBo+wlr0WUo7dar2o8gu7FarrILTSdWFokM
	 ks1zSI+1ncErg==
Date: Mon, 23 Nov 2026 13:21:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, ychuang3@nuvoton.com, 
	schung@nuvoton.com, p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: reset: nuvoton,ma35d1-reset: Add
 #thermal-sensor-cells
Message-ID: <20261123-clever-ingenious-saluki-5ea443@quoll>
References: <20261117060501.2611071-1-zychennvt@gmail.com>
 <20261117060501.2611071-2-zychennvt@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261117060501.2611071-2-zychennvt@gmail.com>
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

On Tue, Nov 17, 2026 at 02:04:58PM +0800, Zi-Yu Chen wrote:
> The system management (SYS) block of the MA35D1 SoC also hosts the
> on-chip temperature sensor. The sensor is controlled through a single
> SYS register and has no resources of its own.
> 
> Allow the SYS node to act as a thermal sensor provider instead of
> adding a child node that would only exist to instantiate a driver.
> 
> Reference the common thermal-sensor schema and update the title to
> reflect that the node describes the whole SYS block. This makes
> #thermal-sensor-cells a required property, which is fine as the sensor
> is always present in the SoC and no driver depends on the property.
> 
> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
> ---
>  .../bindings/reset/nuvoton,ma35d1-reset.yaml        | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


