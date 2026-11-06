Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1564606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LwKT488S;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IVwKxxUh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sykp4o/+jigFXiA4+ilYlXp+/rgV6/09mQP79j9S/us=; b=LwKT488S9Mpk+VH8+6Sg8VSbpW
	wgic3WhcL9/K/3m2qg50Hq6hYS1Co0O52oTDKRxuMJjd5Dmic9QwhdK2yWNpNgV9s1HoB0AnMLWaQ
	mssLXz25GjPUeRaG+4+gxRqXgORVT+tR1+T7BghM6RCZr+p6sPljR+KJpjGZPPsAxWc6dtdeinQj9
	Kg7PMCB0IZ2+sXoifXRERbuWIkpYYDmBjnNje+W/XlatsJFtln1L5XjD73tB43EAHm9zQhKWCSU59
	umN+h5+VLgbfVUmlf9rABQ7AwnrlFIYOUqqjUcCC2Hq/1bV9uzO+OUdwwQHYbvvv0m6vwAhJOpPWW
	OLmRz/kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLYI-0000000Cmdo-3hiA;
	Fri, 06 Nov 2026 15:08:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLYH-0000000CmdS-0WPP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:08:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C60AE402F8;
	Fri,  6 Nov 2026 15:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741CF1F0089F;
	Fri,  6 Nov 2026 15:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793977704;
	bh=Sykp4o/+jigFXiA4+ilYlXp+/rgV6/09mQP79j9S/us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IVwKxxUhudP6RzHQOzDgbAjaH4xylq1CsAsHRSwnkeemBd9LrNTk96sTCoZ0OQFRG
	 lCe0tZHupUyZ/DJCOM2Ce4zDcIQqqQm/4CavmxGdVTsEeSKqIwKAYU/Gqy/meCssCm
	 PhJJGdUeKjGjgZGJTmlgzpPFVzTM63+ZhFnm72DIe9zV/x+zCRKdn9MiZXEPG5gXzg
	 3naESWWBaOkM+TI7clfa7v9FbFReidls9Ow1vxOEjmBpWrAj/FO3kCAH667gyZHwdm
	 oSC2FU9s5fM9V96o6A9wQnWQlXzFpy8bHTIguBZVPmJ/4lINSP1lZROuW1No/Az6eN
	 HzN8jiNHe3vFw==
Date: Fri, 6 Nov 2026 09:08:22 -0600
From: Rob Herring <robh@kernel.org>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: yin.li@oss.qualcomm.com, james.morse@arm.com, ben.horgan@arm.com,
	sdonthineni@nvidia.com, andre.przywara@arm.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for
 resctrl
Message-ID: <20261106150822.GA3193214-robh@kernel.org>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261104081302.304667-1-leeonion.muyu@gmail.com>
 <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
 <20261105055347.947416-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105055347.947416-1-leeonion.muyu@gmail.com>
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

On Thu, Nov 05, 2026 at 01:53:47PM +0800, Ping Li wrote:
> Hi Yin,
> 
> Sure. Our memory controller MSC is described as a top-level node.
> The MPAM register window is mapped independently in the SoC (the
> component sits on the DDR egress path rather than being a sub-block
> of a memory-controller DT node), so the node is a direct child of
> the root:
> 
> 	ddr_msc: msc@2238000 {
> 		compatible = "<vendor>,<soc>-ddr-qos",
> 			     "arm,mpam-memory-controller-msc",
> 			     "arm,mpam-msc";
> 		reg = <0x0 0x02238000 0x0 0x1000>;
> 		arm,not-ready-us = <10>;
> 	};
> 
> The first compatible in the list is for our platform glue; I have
> replaced it with a placeholder here since it is not relevant to the
> binding discussion.
> 
> Notes on the properties, in case they matter for the binding:
> 
> - reg: the MPAM register window. Only a subset of the architectural
>   register space is implemented, so the size is the truncated window.
> - single RIS: the component reports HAS_RIS=0, so there are no
>   ris@N child nodes.
> - no interrupts: the component has no MPAM ESR block, so there is
>   no interrupts property.
> - arm,not-ready-us: 10.
> 
> The verified probe path: the node matches via "arm,mpam-msc", and
> patch 6/8 in v3 classifies it as MPAM_CLASS_MEMORY and treats it as
> accessible from all CPUs, which is exactly the behavior we need.
> 
> One question in return: with the node being a direct child of the
> root rather than a child of a memory-controller node, is that a
> form the binding should cover? If the binding expects the MSC to
> always be a sub-node of a memory controller, we would need the
> top-level form to be allowed as well.

This would be why we're not upstreaming the binding without users. We 
need actual h/w to validate the binding works.

Rob

