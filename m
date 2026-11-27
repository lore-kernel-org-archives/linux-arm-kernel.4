Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D839606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jEE2fkwL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beGRJjhX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LHoWDmO83nUIJwGp2ijnmT3r8R9SA8Kocc8GMOeWdpY=; b=jEE2fkwL17nrt9Q+KysCW6GmoT
	XSRkWSXHztnsg8cQBagyhfVrviMmsRLqKCeu/1GXSXvmzpEDRcNBR1z2AYEkaFoTilwGXAd/zuAkq
	c1DFls8ldo5lICUX1a4pEIiE5+ySWSbAWC9s+Htj6Jxi0gBCutOLnVC2HKgSnOSqhnRMMIX6u1H+M
	yXNSjJaDjDfYnA2kp+FCT398u4AVHa2pxYBHEPAtkZpYr52msyOG8/+ioR6XVjGPGJZEMGBY1Xqnc
	4VhQ/ZwMxfaetcX1fLgk79JUQkau/upGSMxkZMRJXqVw/uWjPYtpfkc9D3dbSIfy0H+NeYlCa+aoq
	0k42zJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtDU-0000000Fbz6-2gJC;
	Fri, 27 Nov 2026 10:30:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtDT-0000000Fbyw-3EAl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:30:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4A2061DFD;
	Fri, 27 Nov 2026 10:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7821F000C1;
	Fri, 27 Nov 2026 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795775406;
	bh=LHoWDmO83nUIJwGp2ijnmT3r8R9SA8Kocc8GMOeWdpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=beGRJjhXZLxSuhuI8uCkyWxzjjU3YFgmKxBL6h/JwCB8I/e2wgYvba6l6MnBt7qA6
	 3N8g0frPXK7A3bHU7JnUgrdqPx1FwgWDjIpR56AyjFr6ikq8y2BqSCap6zgcCjlaXG
	 pJRMIL6Rxkec7bt3L9Ir//Nah/2Uw9Y6W+i/WWkz38enDzox/gvcq/JMhkv7YNXGYF
	 IEYi99IziBO2g84dn9agCXiPMqGtW3yLI8cGCLT3KuHJPxVIRoFJ1aAIEY+hJHBr37
	 Pu2Cw27Vyxj5uZllf1hB3c5uwIdnos6y526RtIsGjK376SP1zhPp11VRVrBIOf7WSG
	 hc+M2ajKAeqKg==
Date: Fri, 27 Nov 2026 11:30:02 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/2] i2c: Add Cortina Systems CS75xx I2C controller
 driver
Message-ID: <awlbkHttSAYifRiR@zenone.zhora.eu>
References: <20261124-cs75xx-i2c-v8-0-d0800b967886@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-cs75xx-i2c-v8-0-d0800b967886@gmail.com>
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

Hi Fil,

...

> Fil Dunsky (2):
>       dt-bindings: i2c: Add Cortina Systems CS7542 I2C controller
>       i2c: Add Cortina Systems CS75xx I2C controller driver

pushed to i2c/i2c.

Thanks,
Andi

