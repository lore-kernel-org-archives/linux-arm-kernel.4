Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98204606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dFlk/JYy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oydEpl5q;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=oA37q7RK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1Mj/7zNTFxvoo0YnADhIrDpQzE4e1mgOjutHuCj90zM=; b=dFlk/JYy3K7xPznv7xcckB/Xu4
	QI7nN/WRvuIee6Nw7npOv5R5YI7ixPuybXSpNa2658OKIgu50kKqDvuzx2MYRmLXmIYw28DNcWT0X
	H3jNzG7oV79V735fi7RXLw3TWnfCmXKarh49wpUxou2N4xv/Z8HNf9l6Swot+oPmbexpQF6OSVX44
	4j/zloC/kq9nFqNGszRmfq5jQ/VqqBtvSFgigmp+uwQfrnIDKKL8VeOe7Suo1t5J0FWkLXtmYQERG
	Kb0qNKUcaGS+FjkzfgdpJtkONQNSTDQxD/xfFI2NgYrp5Gzkhgp+qVCqaZdMP6KRgU3/dzj1HevQy
	Qj7Jji4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbk7-00000008JG1-1tdM;
	Wed, 18 Nov 2026 09:14:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbk5-00000008JF9-19oE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 09:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1Mj/7zNTFxvoo0YnADhIrDpQzE4e1mgOjutHuCj90zM=; b=oydEpl5qerLjUN2tq7BvDzV2IE
	EQVPZhmxU/bzLsYgyXROBYbB8Jl/Xr/g9jsoCQj278LTDyrU61r0ckawggGg5gY94Cj3YwLFK3XtU
	uujkcTFI9bPhF3ty1uwhU0iaOavwZxaBGQhOUZdDY+8ISI5TD1Vjf4w7UH36mumIVjESK8grMmHgB
	aShmONWg3dYdTfN1pn2QfceP9AWklZ9Htrnp3LVdJz9LJDf1+GSLLRtW7eW2/tRqztMT5+t/qY14d
	CyDEq0txiNxyh4GPbIUAoFZf8C/GhXXmMWmU5LBxLuZPot/vK8ewhJN3nicrChg37ZaGM6a247FIr
	f7b47rtA==;
Received: from mail11.truemail.it ([217.194.8.81])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbjv-0000000BiyG-1rkK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 09:14:11 +0000
Received: from francesco-nb (93-38-173-255.ip71.fastwebnet.it [93.38.173.255])
	by mail11.truemail.it (Postfix) with ESMTPA id C841A1FB3F;
	Wed, 18 Nov 2026 10:13:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794993236;
	bh=1Mj/7zNTFxvoo0YnADhIrDpQzE4e1mgOjutHuCj90zM=; h=From:To:Subject;
	b=oA37q7RKSzbZUDsZ4P4vc1g/8RuFjYJGzYdlZK7kKB4Ii+UXppDWqV40OmEqk9lr3
	 vw/nFFOfLGJQzf2guxqLNOvDWLiHaDAA1okMAL062eG9Fn1tpB3DtsC3s8iWcAiC9K
	 8/Cd360XxMCEtFqBM7ODnlcS4/pOH/YLz6bM7JWILQrkWjUSnWCLrULkWZSKfZjpRC
	 07n7PHWYie0II1fhplVPwyiNK/ZM32je0lX/RjO0QG2NcxpHDoR6z6kNvTHmtfh3zm
	 LdnnX5Qdy5lrWMR4l1L07jzNYs1EzuOsZhlrLD8WxK11JnFYHXKHQSgA/s7bvcpcPR
	 gm3OycSQdzKcA==
Date: Wed, 18 Nov 2026 10:13:50 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am69-aquila: Add ath12k
 calibration variant
Message-ID: <20261118091350.GA133044@francesco-nb>
References: <20261117174154.549590-4-ivitro@gmail.com>
 <20261117174154.549590-6-ivitro@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117174154.549590-6-ivitro@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_091404_093533_8B051D98 
X-CRM114-Status: UNSURE (   9.02  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 05:41:56PM +0000, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> The Aquila AM69 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
> module reports the same PCI and QMI IDs as other WCN7850 designs,
> and its board data also comes in variants for different regulatory
> domains (US/EU/JP, UK/CA low and high). The IDs alone therefore
> cannot identify the right board data.
> 
> Describe the Wi-Fi device behind the PCIE3 root port and set
> qcom,calibration-variant to the US/EU/JP board data.
> 
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


