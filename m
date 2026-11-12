Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B71606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 01:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z0SXnQ4z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nFAtWIIO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m+Hm8h27H+tMrn8DnDQGWdsE10AXH5b7GXOSSBSzWEk=; b=Z0SXnQ4zrctSab
	aXqlPArO4auPcvVzSnfEfgCX5MFSzmUO4qR5b7/r1K0Gsos+5BsX4HuGja3tiHuWCIc4PZLe3u0m8
	IriLmZC/yRaOzg9LONkQSZQV34rDjAYEZdshkoOusNA5Wurqvsq/A/bniPbwP1HrZFDtOIefgNpgz
	+BMuujbxIknJTWkqTmz0qYpojM4kShN0ngHg0A3YVG/YiXs7e6NW5x1zx5yZ15fHF3avCSoqYnJIQ
	x4sPU/D1yScLL2JvFa6ovjgonUhrgbD3H3oSfhTTSFKtskmc5B2LDJBkJo2pff55zkUP9eCEPXoxF
	XDZYmWCPYJWcfejl2BfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJZo-00000008KtN-0GHy;
	Thu, 12 Nov 2026 01:26:08 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJZl-00000008KsO-0pQL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 01:26:06 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1931ff67a29so6665740c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 17:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446764; x=1795051564; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+Hm8h27H+tMrn8DnDQGWdsE10AXH5b7GXOSSBSzWEk=;
        b=nFAtWIIOT53NSKmLZG1eYfNqum6RocSisp9FPv1hDFpC9SfWmXztKiKNOpfRPBDxvv
         tq3hq0L+0CHa06shr4s6v+tYEdpLI/ElyNoNnOX9pnBDCyW7BBoyK9SxApf8ZaCsehRu
         lIRo90a0vMP6WS/lA8847RODxUNxm4E67z/Vy9aYA4iW72tjeUcS7PSYpjhUdfIMlVC/
         7l+V16GFDkhT4QRXuaz8HR+VxzhrUZeKQ632SJhr4cMNqZwifDSyRRlIn4NLug2634gl
         SNLpTkR++XAvJ2uc759bgfiINpbcSFmM++hqmIf4hLA+aG4lKGwSCw//tKXxuxA6jIG+
         fo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446764; x=1795051564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+Hm8h27H+tMrn8DnDQGWdsE10AXH5b7GXOSSBSzWEk=;
        b=lczAngYZcdQ2q7n8JTkvF+cAqOm1FJfi0Gi0Skv4Uvns+mG0r7Kpzs7HasI3YaNKKN
         Mlg6eYHkjFCTFzykbzBEgBtkgMS+PZc1kznIxk6m9Ra+4q9JYElnPHXhSivHLveswcJ0
         OH3fH/3SgGgnTGLPvOAR/8C6Ok1qaV2lFHMM67QqzrNz8iEJsYiAZFCcZ0mdxMgsF9Gt
         A8OycqHx8d5lWTpgMGJ2L4Vqb38pf4GMh0XiuKlOssRoBXisF4aRv69qa7AmnlJV2/9C
         sLAQVg51moIw8KDeuchdT3gqWMRLkVGyPafLdwkJraKWyZPfHjH6B6iAy69slwr+PMQt
         mOzw==
X-Forwarded-Encrypted: i=1; AL+hErHfMmnOTNYVSYu+FY94Rkp1PTyaFZtx7wumEV1Qus1o5eRMoxmVWyc0oliFsE0RmX/izzS1oqXn/FMDKIBOf15x@lists.infradead.org
X-Gm-Message-State: APuU4Z9T76KhK+4IkDLyUg4oER6QiJfkJ+mlbv1F/DefMJbe0ZLXLJJq
	5CcPRnKlnj1JNqxO87Fvn+6nK6lWVB43dkM8YoFFWFx/wmWwMStJkXeo
X-Gm-Gg: AYBFou1ssYRLxhKsJpzutSrRB5Xnj90ReKPb/RZcs6lcbbTS4PVxNP03GqyraQYx91Y
	GQaY/TX+vWFgI5+4YxGJ8jGSamGNmAp6869yNWs/+6nk/ErWP1KcYSuQRZVlCaw/ZqUgD6Log4c
	uVazGOBE/UTBpXm06rMFnC1pULzNTpgZYXrxHYIcVRxpHLIPVugDYafGZiHirAJBOxIXB5I1dBQ
	A2eyFCANNa0DQ1w3sMYV1QrEsMXKP+8G0/XtPyGxm4aFtKebsHPsLmoddG95zIYGlsgvtIF1XVj
	50sKJyX5WKsfcWkGhLsVI/s0XDY5onqGAX4QqqR9zXw0Bhrd/SKswaEJvCcdSN4c197ztygImgl
	dnB71QoDNcmtfR0Ez0KD2q0NT3o9rq6WnDFKP2rIcB/bdUOemcd+7dP3G/7FQsPbbKC4j7EjQOA
	t8IJRLWhs4WD7uyhrTrscKmPN5CTKWktdK67myM4ftXTQFm40fe3UamhlJ5QhpoNLM2CFuxXawa
	bPFbrCZY/PDEt6Wiw58oPMFnAnhnc+jgFGNG1OGmPGwJm0W3xY/+TyyCSP6vCijqUUbf5aOHyVn
	ks+uL97ZNS3vWt52LVFrCowZ6mr9EihPnQaK6VqxuXoShPBlmQdx2CGx+ZA/VW+j8aAOOLXn3JR
	iCqs7
X-Received: by 2002:a05:701b:21c3:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b3c02fdb4fmr3591375c88.9.1794446764133;
        Wed, 11 Nov 2026 17:26:04 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm20110159c88.2.2026.11.11.17.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 17:26:03 -0800 (PST)
Message-ID: <c52e7b57-9d40-456c-a2f6-545c0bca9b46@gmail.com>
Date: Thu, 12 Nov 2026 09:26:00 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: andy@kernel.org, conor+dt@kernel.org, cwweng@nuvoton.com,
 devicetree@vger.kernel.org, dlechner@baylibre.com, jic23@kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, nuno.sa@analog.com,
 robh@kernel.org
References: <20261104091136.151269-3-cwweng.linux@gmail.com>
 <SN1PR12MB2528F7F6F04801AB698A5A60A5712@SN1PR12MB2528.namprd12.prod.outlook.com>
 <avR2DaxSJJwpnWP9@ashevche-desk.local>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <avR2DaxSJJwpnWP9@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172605_240252_B2949FEF 
X-CRM114-Status: GOOD (  13.38  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



Andy Shevchenko 於 2026/11/11 下午 10:05 寫道:
> On Tue, Nov 10, 2026 at 08:08:03PM -0600, Victor Chernyakin wrote:
> 
> ...
> 
>>> +	if (!num_channels)
>>> +		return dev_err_probe(dev, -ENOENT, "no ADC channels configured\n");
>>> +
>>> +	if (num_channels > MA35D1_EADC_MAX_EXT_CHANNELS)
>>> +		return dev_err_probe(dev, -ENOSPC, "too many ADC channels\n");
>>> +
>>> +	channels = devm_kcalloc(dev, size_add(num_channels, 1),
>>> +				sizeof(*channels), GFP_KERNEL);
>>
>> Couldn't size_add() just be regular +?
>> (Question to Andy who originally suggested it)
>> We've just checked that num_channels is small and won't overflow.
> 
> While that's true, the other aspect(s) of this is in play. Namely we want to
> have the same pattern over the kernel that makes code robust (tomorrow some
> cases can be modified unnoticed with opening such an issue again) along with
> the potential of finding those patterns and update in case of mass-updates
> of low-level API, and I have heard for the matter of fact that devm_*alloc*()
> are in the plans to move to something like k*alloc_obj*() or k*alloc_flex().
> 

Thanks Victor and Andy for the discussion.

I'll keep size_add() for consistency and future-proofing, as Andy suggested.

Thanks,
Chi-Wen


