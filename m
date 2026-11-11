Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D275E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fo1vX8Qi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fvnh2M1q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T+BHmu+//774PUA/C/Ol2aryXkGv6dUO8fp7NLeJH6s=; b=fo1vX8Qi0SYLCe
	qFu+OqAlDXUQnbsJiTgA5AOTvgZrjP8wzdP3zfKW7Q9YlHj2Syia0YBwRnwQxbCE+JHUX/GbVRHbq
	7NYkelHo96p1TpctT2wEZGUPDaONi8eS4Xqi9nefinFwY3QDtHdXJuVG1sqW8MOZc3hUYfE7wJjNa
	mEJ1HI1Nw4LhYW2/3EE5dr6cSf92yKgxgX/1sWhD3VkFHQ3cDyOzkJWkXc7iCkRQ2VBO4HTXSjWLn
	TMiGsrcBGqx0hOMEoIWB9GSrpmPoydRuKw5bKRkiMe8zjyU5m/OE7FlCJbOJizA1IbtR4WeJ9/T2U
	aeGexUs4bjXmyt7xr6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxsV-00000005QNg-2Rcb;
	Wed, 11 Nov 2026 02:15:59 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxsT-00000005QMH-1WA2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:15:58 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso1116201a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363355; x=1794968155; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T+BHmu+//774PUA/C/Ol2aryXkGv6dUO8fp7NLeJH6s=;
        b=Fvnh2M1qmrDbF/31SSVF29UqeH5U5tyFoviXFxeN5gqmBH6fm039334DOvMt5VKfPy
         7Q0DBfWFMV0BObefaUX7AI2qkyUaujp7Ro2s7teqCsPb/ax0ses/yd4i9G9HyWfXru25
         j0/LbhH4v4ines4JTCD4r9AkagCUMT7Qh16tTRqWNqAdWfyn7VoZNYF33qfPLvqAQYTU
         fkFi9CHKV4n3A9fytgtgLLFWoRQpsw4SP/xqWpq+1493e3PzgUc18HVWuymB6u6A0q6F
         hGqBY7o6RJGVcbtiY6WVaGz+DDyFeeB5tW9KJ4i1bKNvtrTEwpEm5aOw1x33dqXzq6Ub
         lmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363355; x=1794968155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+BHmu+//774PUA/C/Ol2aryXkGv6dUO8fp7NLeJH6s=;
        b=SiUJOd89zEGDePsUxYaC9RTOJGU8HPWkTV9CYGakm4/LzQfzNhZm9eMOOUcftUuoOh
         lYnA0aJj+b5BvNrLD+zM2j9fZOZtchsk+Y0sI+sV+EMeo9ejMdEddmrcB0TMZr1uG+qv
         XoLdqLCaX9C2f+J/DoFxlR6ZPzZ5vA2VykL9kYVoo2UOJ6EfDv6d1IVrCeU28Mxrfxps
         Sqp1bZmnt9h4SFMLRzbxCABnnzLKmPtByWhDsnJrd6sNBfWQE9sIY+Irtr1Gq9KpyswI
         y47CNMIaFxto6EW0VXwEuz4sZAyMFKqCRukg23Wr+c4jaOWOBmsR8eY1KGx2lGPCTMn6
         6Oqw==
X-Forwarded-Encrypted: i=1; AL+hErGwfRRefXMa0wBx73W5pcUIhfWc4oHMuKRyjAeLZC9jg8YfPuvMDyCG2xcpKmlkB1Nv/yM4ZJT/JizbHpTr4OC/@lists.infradead.org
X-Gm-Message-State: APuU4Z/AskqOyO90JwwMung1cWxjOjj5ZzwduB97P2uG/u2fjJRPw0r7
	0PqyY7lVlb1RRhMhfpXYJxwdDVy8CvtQ9Uk7Pi+OhqYl5B+o2izy/WGL
X-Gm-Gg: AYBFou3qyXFAsJbnNvSI/QmCH35v+9BB5om5naVomVoLRfW9me3IR6EFe/miWjy3Kln
	zBmMgpdK/B+EVd6JiHFuJRxc7/FWW829fk6ajHrTHHzoCwhIkwQWbiSR+V3V+u9cVocBO3ydn/Z
	8kw9wHVMIoc0BH6Ta6MX9cqi5B7p9ZD6LyKOMEz4gDB1P163TXMDT+HFVZ8dNsgJCe/YzMdP6HY
	hdJtW6qOau1SDgYyBzoUcbbhrnVRKa2nIoJZ94x0pACRvb1QCLsQWAmj9sbMplSTDGi7A182St6
	I8reO4OabJWZ9glfR2nsuY6Pt+m8Q4HAwKAsEge5H+VHyxcxD6MTmJpSjW/kH7V6bDtBYD5fhEQ
	7JERNvbOvNZ2xPgmkqYtwYIL7mgOnSLim+UnQ0fekyuhJLyQchPoFyT5nx4fHBL74w4Dn40uPB3
	Ciz4TeKvdZb+2Kim0omr/eQkcJtrnIBw09/FdOCtWlyOgqHM3gu0U5l0TrV5IqSkHI7Qm8ggJYb
	0xfVLmpE9SAuC4aZnfgc9aX4psDNmx8G0lMIjLWNdXQ6pnDm4PerAmxLt3WXFmteuttPNzohX0k
	ICzrfW+zys+8B2XWfcq+bcnz3wwotFsVTJqQtqQQ67RW+tFCHPwqirEgadgIXdm3wU712pN9sXY
	PMcdZ4bDbGGh6IRkqQUjnAEqlPg==
X-Received: by 2002:a17:90b:2e83:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b182fe6fc9mr915474a91.44.1794363355359;
        Tue, 10 Nov 2026 18:15:55 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e1d73d1sm1920215a91.11.2026.11.10.18.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:15:54 -0800 (PST)
Message-ID: <f01f7e4b-8c71-461b-bd1f-28de2594abbc@gmail.com>
Date: Wed, 11 Nov 2026 10:15:51 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Rob Herring <robh@kernel.org>
Cc: jic23@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20261104091136.151269-1-cwweng.linux@gmail.com>
 <20261104091136.151269-2-cwweng.linux@gmail.com>
 <20261110190827.GA1322356-robh@kernel.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261110190827.GA1322356-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_181557_410762_FA2C8903 
X-CRM114-Status: GOOD (  19.89  )
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



Rob Herring 於 2026/11/11 上午 03:08 寫道:
> On Wed, Nov 04, 2026 at 05:11:35PM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a binding for the Enhanced Analog-to-Digital Converter found on
>> Nuvoton MA35D1 SoCs.
>>
>> The controller has eight external analog inputs. They can be used as
>> single-ended inputs or as the four fixed differential pairs 0-4, 1-5,
>> 2-6 and 3-7.
>>
>> Use the common ADC channel properties to describe the physical input
>> independently of the logical channel index.
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>> ---
>>   .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++++++++++++++++
>>   1 file changed, 163 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> new file mode 100644
>> index 000000000000..85b0feac0236
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> @@ -0,0 +1,163 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
>> +
>> +maintainers:
>> +  - Chi-Wen Weng <cwweng@nuvoton.com>
>> +
>> +description: |
>> +  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
>> +  12-bit successive approximation converter with eight external analog
>> +  inputs and one internally connected VBAT input.
>> +
>> +  The external inputs can be used as eight single-ended channels or as
>> +  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
>> +  connected VBAT input is not described by a channel child node.
>> +
>> +  The controller provides four interrupt outputs, ADINT0 through ADINT3.
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-eadc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: ADINT0
>> +      - description: ADINT1
>> +      - description: ADINT2
>> +      - description: ADINT3
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  vref-supply:
>> +    description:
>> +      Optional external reference voltage connected to the VREF pin. If this
>> +      supply is absent, the controller uses its internal 1.6 V reference.
>> +
>> +  dmas:
>> +    maxItems: 1
>> +
>> +  dma-names:
>> +    const: rx
>> +
>> +  '#io-channel-cells':
>> +    const: 1
>> +    description:
>> +      The cell selects the logical EADC channel identified by the reg value
>> +      of the corresponding channel child node.
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  '^channel@[0-7]$':
>> +    type: object
>> +    $ref: /schemas/iio/adc/adc.yaml#
>> +    description: |
>> +      External EADC channel description. The reg property identifies the
>> +      logical IIO channel index.
>> +
>> +      A single-ended channel may use single-channel to select an external
>> +      analog input independently of reg. If single-channel and diff-channels
>> +      are both absent, the external analog input is selected by reg.
>> +
>> +      A differential channel uses diff-channels to select one of the fixed
>> +      hardware input pairs: 0-4, 1-5, 2-6 or 3-7. Each single-ended input
>> +      and each differential input pair may be described at most once.
>> +
>> +    properties:
>> +      reg:
>> +        maximum: 7
>> +
>> +      single-channel:
>> +        maximum: 7
>> +
>> +      diff-channels:
>> +        oneOf:
>> +          - items:
>> +              - const: 0
>> +              - const: 4
>> +          - items:
>> +              - const: 1
>> +              - const: 5
>> +          - items:
>> +              - const: 2
>> +              - const: 6
>> +          - items:
>> +              - const: 3
>> +              - const: 7
>> +
>> +    allOf:
>> +      - not:
>> +          required:
>> +            - single-channel
>> +            - diff-channels
>> +
>> +    required:
>> +      - reg
> 
> The allOf and required are effectively covered by adc.yaml already.
> 
> Rob

Hi Rob,

 > The allOf and required are effectively covered by adc.yaml already.

The channel-level required list is redundant; I'll remove it.

For the allOf, adc.yaml currently has:

anyOf:
   - oneOf:
       - required:
           - reg
           - diff-channels
       - required:
           - reg
           - single-channel
   - required:
       - reg

When both single-channel and diff-channels are present, the inner
oneOf fails, but the reg-only branch still satisfies the outer anyOf.
Removing the local constraint would therefore allow both properties
together, which the driver rejects.

Should I keep the local check, or move the mutual-exclusion constraint
into adc.yaml?

Thanks,
Chi-Wen




