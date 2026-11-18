Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8680606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XYA74YmY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ct64jBlu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n6Pt66wYYAB7YiGLR+iun8iZYXIL16iCn4Z4QJ39GVY=; b=XYA74YmYnAZ5QYveUpo/Z4vEbn
	loDXAL3n6ssZuvZGdf3CTq1cIuRe54fKmBWwQMYphIJzN0IgQtBgv67JP4bw/sNrSmysixfBQvLFE
	t6gh+3iW7qeQ09uPkg9ufIA45QqoF9fgqCCYzINiMFu6QM9RbHruSzXssJ/A4Bl5s1JMQKRCow+vv
	gJwr44Gxyk6vIs6lsE+srmJpsKmipnG+SxTZT720PUCszhcWdyR2VE/Msi7KtmBhL2HVVRcJ44Ez/
	4RuprXkLIL7VLyd3LKXGPtV4/lwWrDRDX9UQgHML5DCMRyZy4bZcjnWZ9DH1zs0mDrM6xil8PSoLa
	MLetOJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlHw-0000000A6Ej-1Nmn;
	Wed, 18 Nov 2026 19:25:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlHu-0000000A6ER-22xJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 19:25:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4590460CA;
	Wed, 18 Nov 2026 19:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BAF1F000C6;
	Wed, 18 Nov 2026 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795029945;
	bh=n6Pt66wYYAB7YiGLR+iun8iZYXIL16iCn4Z4QJ39GVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ct64jBlu1GaovN6tR0kD0NzNn4ECw12nH75D56VTO9j075dMnchB1RF2dRY9GrNcO
	 XiFvikK3lRo+Zpel5LhcFkbVu41sdSblJU4WeUoHXp9xrE0Yh4x3r14jZa8DKqKSVK
	 CIQefNNYidVYzuQy6DWiSxcyWDJOFU5f1DEM1t7RSGbnUvPFaDg1WZW8hB59nsa6K4
	 2mQTFn2mKo2mIOByQson+9dti65Ln/AsGik80r9shhl+2BPNee9b5RRJzGhoSrIsSv
	 CwYinvF7KsNzC3zG+u1SDwCPpb9UwADEisCwX+n1U1nJoCWuM0ZiMiadtoMJ2D8PjX
	 v01FMsH+4MWzA==
Date: Wed, 18 Nov 2026 13:25:43 -0600
From: Rob Herring <robh@kernel.org>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruidong Tian <tianruidong@linux.alibaba.com>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	James Morse <james.morse@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
	Avaneesh Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/5] arm64: ras: Add Device Tree frontend
Message-ID: <20261118192543.GA261024-robh@kernel.org>
References: <20261118-aest-devicetree-support-v4-0-936587251e8f@oss.qualcomm.com>
 <20261118-aest-devicetree-support-v4-2-936587251e8f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-aest-devicetree-support-v4-2-936587251e8f@oss.qualcomm.com>
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
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 12:48:21AM +0530, Umang Chheda wrote:
> Add a Device Tree frontend for the ARM64 RAS driver, allowing it
> to be used on platforms without ACPI firmware.
> 
> The error sources defined in DT are registered as arm64_ras platform
> devices at boot. The frontend produces the same software fwnode properties
> as the ACPI path, so the core driver probes DT and ACPI nodes identically
> without any firmware-specific knowledge.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>

[...]

> +	ret = platform_device_add(pdev);
> +	if (ret)
> +		goto err_put;
> +
> +	pr_debug("registered RAS node %pOF as arm64_ras.%d\n", np, pdev->id);
> +	return 0;
> +
> +err_put:
> +	platform_device_put(pdev);
> +	return ret;
> +}
> +
> +static int __init ras_of_init(void)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *np;
> +	int index = 0, ret;
> +
> +	if (!acpi_disabled)
> +		return 0;
> +
> +	for_each_matching_node_and_match(np, ras_of_match, &match) {
> +		u8 node_type = *(const unsigned long *)match->data;
> +
> +		ret = ras_of_init_one_node(np, node_type, index++);

Why are you rolling your own platform device creation? The DT 
infrastructure will create devices for you. And likely you are getting 2 
devices for every node because you are not setting flags on the nodes to 
prevent that. But setting the flag is not the right thing. Moving all 
this code to driver probe is the right thing. That probably means some 
refactoring have a common probe function that the DT and ACPI probe 
functions can call (assuming there can't just be one common probe).

Rob

