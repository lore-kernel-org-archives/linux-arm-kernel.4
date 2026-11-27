Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B4B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KIMydwcF;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=R6Pxv6sR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Apk+wF3JIOKu8ET+h25TVTVOKsViveOnjA4s7dlaLmI=; b=KIMydwcF7COs/N9oXYQoNrgu9E
	iney5aPIr8GRMZK4yySeoLdJDhIZOwC4tYrI76Ah3jWqSykd2urOcN40rUjmfCUqx2XO01u2v9fQh
	8WSbxemRDLh31/oOPJw1CfFRFOkjmW5ifo2h72tXq+qml5Lgiz3sJcK1Mye6v2pMTeUOJ/JH6SDNm
	1Ego1x6zZ2cDnYMfu6JP9ptCT8p8QV3suNxCTaRe74fw9bXOvJIetA9637Fnpl/+WE9JIvmKDLd6r
	CijQknn+97rvg76DAqAPyDBhcsC1Xl7ifVL3icQPMa+GCMP86NnCXufXOeJK5MFJEjRHs5DNzVEbW
	aMI6nCQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWr60-0000000FF2N-2DCY;
	Fri, 27 Nov 2026 08:14:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWr5x-0000000FF21-1vfY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:14:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso3566084f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 00:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795767251; x=1796372051; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Apk+wF3JIOKu8ET+h25TVTVOKsViveOnjA4s7dlaLmI=;
        b=R6Pxv6sRZQ2xdUrlU315avC3K+LKyHDv7wPLD6zNHGcphj8FbH2inHdiKlZv/xc2V5
         Eu4Hei0ErGpyN+xE/YIaTx9qKWh0F+UJmzJ710KBDF2uPpCLikalWxy9heLzHkQkubJS
         cU1T25wykFBPfWDTbed8BLxDZqK6e+QopFoRW3OiGL+H91Cx8wMH7rZe/VUqj3h23FBp
         FT+G1jIPeNRGECmjjbaQuv2AWpsr5yykFyJMRI0J3/gKN/VBj/9PH9d2uPS8SxWZjoCk
         G5hJw+RG/QgL23wU8v0ArF6NpDyaVVrJgbBYLszS2/s8QRdfyZzWkCT77L6/IEzz2sYW
         JC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795767251; x=1796372051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Apk+wF3JIOKu8ET+h25TVTVOKsViveOnjA4s7dlaLmI=;
        b=RDCGF6szu89VUgo/rIwelEWUXcliyFtLn+gKVDH3yhVHLoqOgC+OirtNChQXxdp+TU
         cDvz7XFNeEDLsu915SaByOBgAiLlFRqAw3LCrU8KncFWJb5eMb3l52n+xnKbtwOBYJNw
         qh9IjVSonEKY43CfifLpgheDSSTviWdjkC34rHsfc7+DQLrCWlZmhN0v5Py7pPicSYl2
         LyEk779SoCG2hv3owtGaAo9iJzmILB+z/OdgQK/Gk6unVSWi/fWCwxvr/JsZejfuPOjF
         01eKdL0nvAY4V8rWAipDKlYY79Zv5+fTnZYsCn3c6J+u4eS9wLic57jNTQJ/ISoSQEjt
         S1RA==
X-Forwarded-Encrypted: i=1; AL+hErGxncnf7w586/IEAd+lcdp54FQGqp8emHjrpw2uJhgl+zK36mzqW98hu7MqScHG57pq+bFFTyyqrfAnTMQ3CEaM@lists.infradead.org
X-Gm-Message-State: APuU4Z9qdKUNyOSVkfwOp8fUUZpNXdCU3QqlhNQq6F0rKA3zy+SY0uEl
	uwZDI125HlrDa4J5Z+QmST9l90b+mHo8vuElOc9PpVv+0b77K4OmQXO9bDfcS63HfbI=
X-Gm-Gg: AZFdTZcmH0xzu8mhYQnHOmAR+wRed4Sfn8j2/Q8vkhbu9PPsJ09oU/Ojr/qfddx5ctH
	nEC6FC8ixuqc39mTlT0npTMeIx+oAjJ9xov9WjSBP7MeTPifp7ZwGoRrA6S5W681yqrf6DRRfSC
	kdNNmtEigWoU+IJToRciaBz0a7HjfdJ9aPigi1mzEzHLs6SjCPr/EsdUnpaIFrZ05zhaD0L5wxn
	BjOWzaqce1kgQ72Efv0zDO6D2mbS41wLCbsco6uo3v9t9vudcm79LPYb8xG66Lgs3AtGYFoKiex
	J4V1i8et0KZHgkS4GwCr7RNSJMXc1GUW8pISMPdAj5UQUAqLSV4IBJahqUJV77ul8psg6iIvO4L
	CEsyDEyTYnS6+dXpBGXGEsHZe/F9f1Du21EDKudFitx3IVxUW0ZvCKHsXBEOGjLAuSQtThWs+mJ
	wDjOUXaboM/1AmbkBUOxl1nm7VkBWlFIXfK+A7OaR5UE0KjYl4yRJRQeB0kSOBU7Dw5MOqDg15w
	C5LQPGLdYNOt7ihXvH8gyAao8/RtssaxDku7Kz3+mT+It3EXD0KujJmb+j0dGm8Eefq/MWpcqRv
	ogYsNudfnlOsPeA7hHk=
X-Received: by 2002:a05:6000:40ca:b0:4a3:976e:27a2 with SMTP id ffacd0b85a97d-4abb5146238mr46038597f8f.34.1795767250897;
        Fri, 27 Nov 2026 00:14:10 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm52271979f8f.24.2026.11.27.00.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:14:10 -0800 (PST)
Date: Fri, 27 Nov 2026 11:14:07 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH v2 09/16] KVM: arm64: Report faults from S1 walk setup at
 the expected start level
Message-ID: <awk7z5-ZlzQDqfcz@stanley.mountain>
References: <20250915114451.660351-1-maz@kernel.org>
 <20250915114451.660351-10-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915114451.660351-10-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_001413_752797_B4A86C19 
X-CRM114-Status: GOOD (  18.65  )
X-Spam-Score: -1.8 (-)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Mon, Sep 15, 2025 at 12:44:44PM +0100, Marc Zyngier wrote:
> Translation faults from TTBR must be reported on the start level,
> and not level-0. Enforcing this requires moving quite a lot of
> code around so that the start level can be computed early enough
> that it is usable.
> 

[ snip ]

> @@ -351,12 +351,17 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
>  
>  	return 0;
>  
> -addrsz:				/* Address Size Fault level 0 */
> +addrsz:
> +	/*
> +	 * Address Size Fault level 0 to indicate it comes from TTBR.
> +	 * yes, this is an oddity.
> +	 */
>  	fail_s1_walk(wr, ESR_ELx_FSC_ADDRSZ_L(0), false);
>  	return -EFAULT;
>  
> -transfault_l0:			/* Translation Fault level 0 */
> -	fail_s1_walk(wr, ESR_ELx_FSC_FAULT_L(0), false);
> +transfault:
> +	/* Translation Fault on start level */
> +	fail_s1_walk(wr, ESR_ELx_FSC_FAULT_L(wi->sl), false);
                                             ^^^^^^
Switching this from 0 to wi->sl was obvoiusly done deliberately but Pereq
is trying to do formal verification based on reading the ARM docs and
matching it with the kernel and the AArch64.AArch64_S1Translate() pseudo
code uses a zero here.

>  	return -EFAULT;
>  }

Part of the issue is that wi->sl can be totally bogus.

   274          ia_bits = get_ia_size(wi);
                                      ^^
ia_bits is based on wl->txsz

   275  
   276          /* AArch64.S1StartLevel() */
   277          stride = wi->pgshift - 3;
   278          wi->sl = 3 - (((ia_bits - 1) - wi->pgshift) / stride);

so wi->sl is based on ->txsx and the "- wi->pgshift" subtract can
underflow.  We check txsz if is invalid later "if (wi->txsz > 39)" etc
but we still end up using the original "wi->sl" invalid start level.

If we made invalid values of ->txsz use zero that would fix my test
cases but it still wouldn't match the doc.

regards,
dan carpenter

