Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35B1606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 04:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ETbU6/RS;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Sc6fSMSq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bka+P1SKn7+o7710EoziSWAmGI6ixZAyxquFEjs1PAs=; b=ETbU6/RSAxRN69
	fGZSc3+gQKxcQqfh7uoXDftBE8H0UBLFWlDAzhXY3XFz0rVognsFTuTckWw0JyXzgJvQc+vXf5JJm
	0I/9ZCOZJ+pch1G7kL+9rur/kZQH/oc+3+6yFqZYFDPv4oHj/rDtL9pJXsr7EVGUtByymQ0xyhuf8
	NL/Gcsxr2yCQ6vAlOoKMyhAg4C0A0iG4o7A9WmkLB8u/Lzzcs57+Y91TjTaW7S8NWma8PREWRDZpP
	3/tvGE5MTnv7d5AoY7o56IugCESBvvm3rq+ZAO8sZ1bk3CtJLlvcGBvxMfmbgXAMBddyY1UZA8HTs
	J9HoS/lawkkaE+7uu1UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzjU-00000005avO-3Sqj;
	Wed, 11 Nov 2026 04:14:48 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzjR-00000005atq-2zeu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 04:14:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24FC410DD83;
	Wed, 11 Nov 2026 05:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794370480;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Bka+P1SKn7+o7710EoziSWAmGI6ixZAyxquFEjs1PAs=;
	b=Sc6fSMSquBBcfsDHjtLo5bB5J7aopkltjJTi9XygiXTqObpYtwnCoIaEWwubIqF9Dg5esX
	stboBY5p3f1nt2Lt6QNF1bd+2n9NLY98oj9ejH3UF09a1bbCnOMu+6/6RMbYaU6Z3/7f/z
	o45+dbX++pyipfFfta+I+cddBceOuULLpMl6cYgao1QMmeE32E7tEQS9ClpHBwqmnASXhq
	NdO7N8gVgguw/1aG+cB8MjCk5Rz8cr+oKG/cSwaGnSK7pYNcFePgswpHdIdX3Pgdx6fmkX
	t0oVJ2p6tcdq37rCk5s/KWlqLf+/FeMU1cZj1hG6F2T1Tt+0LApWj8I/fTKBEg==
Message-ID: <58f2ae35-c310-491a-a4c2-ead854ad10e8@nabladev.com>
Date: Wed, 11 Nov 2026 03:41:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: usb: generic-ehci: Restrict
 access-controllers to ST STM32MP2 SoC
To: linux-arm-kernel@lists.infradead.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org
References: <20260907161203.713424-1-marex@nabladev.com>
 <20260907161203.713424-2-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260907161203.713424-2-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_201445_918634_873CC776 
X-CRM114-Status: GOOD (  14.02  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/7/26 6:11 PM, Marek Vasut wrote:
> Tighten the access-controllers DT property availability, restrict it
> only to ST STM32MP2 SoC, which is currently the only known user of it.
> Once more users start using access-controllers, the restriction can be
> losened here.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
>   Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> index 908b02d9175e0..9f5130a0e784c 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -217,6 +217,9 @@ allOf:
>         required:
>           - access-controllers
>           - clocks
> +    else:
> +      properties:
> +        access-controllers: false
>   
>   unevaluatedProperties: false
>   

How can we proceed with these patches ?

Thank you for your help !

