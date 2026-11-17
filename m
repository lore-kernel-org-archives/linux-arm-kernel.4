Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4306606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Lat4Tl6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/7sDtw7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rml9Tae3yUrPwjvQLyFAzHjGFjivfeaY5pWvQRSh8QM=; b=3Lat4Tl6aPI2Od
	4+3cIKys8GKSHuAwanZttNJLd7iQTu5sgK8CIg9rCyqiyf6JNXdGEuMTkirhT8ntBQ9uWn+/pt5SE
	kAfJEvolzUvxDjjc8hLmj0RUFZ20ofwsgo7Q4LghtqqzQ5li3v/qh4fCln6z10vBqFx2qaERU0bGi
	dtgN4gdA0yBdQcF4RsTbAeAAiljfGF+b/AsLmd3GTgRRXgktFpJwtWZ+liOXBRAajWd55uUv2VSJM
	ilMQO4lm5bUWatdQll2nggPGkNOBtxsC2qfacyjvDJqtjHW/xPaNAHfEvBm3skQu4sJ8L9YJF47uF
	KUXW+gvJvLEvDOWWs20Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF5p-000000050Mc-0a2S;
	Tue, 17 Nov 2026 09:03:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF5l-000000050M7-3MqS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:03:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so2094262b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 01:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794906185; x=1795510985; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rml9Tae3yUrPwjvQLyFAzHjGFjivfeaY5pWvQRSh8QM=;
        b=m/7sDtw7Aasv2NrNGN19ip0uQ8GENk/MAjV3GV7N2oclD+44kh0fb4Hm6ZoaF7Oaa2
         b2e1clBbYug7WnUz52XYwBMPhsvKS/Am+Q+Xsxx29uQbidJblrNp7aukxjSEPr+WbwMb
         FD5hkbRAwdlKVDkhwaidaK2LUMYS4ypesZzdv8A1/OXRGOcoTutzZBmNx2aJJZsqDEPB
         CdmhrCvs63U30co7inARp5xOuwY4OVGGnZEk6zoUEX9uB7290nkdpCGZpl0mmTVWOE7c
         dYYFCnu+DAoT4KePT1WZle7xE2dkKF0LKzq99yccSDVQl6DMDMvI6zwaUxnFPckDS15S
         8khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906185; x=1795510985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rml9Tae3yUrPwjvQLyFAzHjGFjivfeaY5pWvQRSh8QM=;
        b=yozs2jovLro8/+A+uVAQp0urKCKCactwhuEFx3F6fJKOz39vcnLeQCQEJ9AIVPhswH
         ZvzFs+fyWsOkEfKbNrb+68Ttq9B0hoPZXHO5keIjGnoqhKI4GZ4RuEI2EH2HJim+DCAh
         n+X5BiFUCCynVV5bqYimVeSD3z1jT5EzgWG42V9faOj6wRiI+xPhX6IOKxa4WO8/8NXZ
         AADINljRPYQ/seLG07KltJmeNMyrtQJYU4n+v3+yqeI05os3X15Zcv0s/8quPsHvhVuA
         zTe2l+MfN0oEVnAOr8pVc+N+W+QcHNB1OhMGx83vDjcdBjZmu9ldrYlKe/Ddy8NIuCJD
         08sw==
X-Forwarded-Encrypted: i=1; AL+hErH6s128A2XmGy6OGlfqsWOOoBkKIebN8KjkwcPrkYc0Tf13i9pMWV/AIsmc7MvpOFUJoUrSriBgSzCPWja8V5xM@lists.infradead.org
X-Gm-Message-State: APuU4Z/q3dUTAq3XQK5218QcJcvNGm+k4sLvQTmHjpi+1Qqwhh2O48w0
	AEKVadt9GjJ4HBUcX8iccC0UG2CZOuAVVsMM8jA2Jpr9a4QF894pPzsl
X-Gm-Gg: AYBFou3BqNmwrFUjgbHEst1rnuw/hU6Psn0X9BDj3dzfWZMGWjzR00Gtu09hoF7x0uk
	GLTlJN5PJ1TuumOvo5or+NHYNqE3nvEy0w1SIfD7qlzc4RwiYCKTyNYT+l30dlUqsBMPIhmcrsN
	bWeJKiYWSdHWx3/RmrRt5arQOZl6OXzFb/P4D/HcKTCV2fExaNw+aFCoTWMQ8SCM7VWZphgZWZd
	nCEmk3kPDLJWXYD/35vvkzyg9NGuEUln5in7KpDaQUO0kzXMlvXxji0kaoOhN//AhLBOba3j2kI
	2irso64IJkpMxdRgdHRxMUx4ozj2xgGfwSrOaNV9EnsRikp+zIByqwJYKNcw1BxgIJiILhlgKUG
	JiFPsNTLQECMfMTewIESBnc7jcxObSMwmCD8JjM/3K3ivsF8a2VcalZLm2RAfh9kj5VKljEa6zE
	qhNLnph0YUZx/ejrfCIO+U8Djvd/4ZoV0MBfftrfQgWvFL2SLcP4h3jdrOI9X6wVw6L+6snROZN
	gSHjot+dcMdBEdnNqPfKFpN0JaVe+6/Z7aBUjte+pM6oXUF++rZWff/tkn/ac3iZOyP3KpbnO/W
	ayppaWY2fsFlq0nrGOKp09sjjsNIILKQEm9qUXbEH6YHQfG0WZUrtEf5achPdASMzKY0hraBcrW
	5AuOf5g==
X-Received: by 2002:a05:6a00:1c9c:b0:89d:5a80:5256 with SMTP id d2e1a72fcca58-8beb56cd05amr11614200b3a.9.1794906184648;
        Tue, 17 Nov 2026 01:03:04 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2a20fc8sm4517468b3a.49.2026.11.17.01.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:03:04 -0800 (PST)
Message-ID: <57e46e27-db98-4f9e-a657-1f224d3428b7@gmail.com>
Date: Tue, 17 Nov 2026 17:02:45 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document
 MA35D1 PDMA controller
To: Frank Li <Frank.li@oss.nxp.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
 <20261109052900.2960473-2-shanchun1218@gmail.com>
 <avtum_vwVClf7xhE@SMW015318>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <avtum_vwVClf7xhE@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_010305_855903_CD8518E0 
X-CRM114-Status: GOOD (  14.85  )
X-Spam-Score: -1.9 (-)
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

Hi Frank,

Thanks for your review.

Best Regards,
Shan-Chun

On 11/17/2026 4:59 AM, Frank Li wrote:
> On Mon, Nov 09, 2026 at 01:28:59PM +0800, Shan-Chun Hung wrote:
>> Add binding for Nuvoton MA35D1 PDMA controller.
>>
>> Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
>> ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
>>   .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>> new file mode 100644
>> index 000000000000..d05971662a5d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>> @@ -0,0 +1,71 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 PDMA controller
>> +
>> +description:
>> +  The MA35D1 SoC has four Peripheral DMA (PDMA) controllers. Each controller
>> +  has 10 channels and performs memory-to-memory, memory-to-peripheral and
>> +  peripheral-to-memory transfers.
>> +
>> +maintainers:
>> +  - Shan-Chun Hung <shanchun1218@gmail.com>
>> +
>> +allOf:
>> +  - $ref: dma-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-pdma
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  "#dma-cells":
>> +    const: 2
>> +    description:
>> +      The first cell is the PDMA channel number. The second cell is the
>> +      peripheral request source number, as listed in the reference manual.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - "#dma-cells"
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
>> +    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        dma-controller@40080000 {
>> +            compatible = "nuvoton,ma35d1-pdma";
>> +            reg = <0x0 0x40080000 0x0 0x2000>;
>> +            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&clk PDMA0_GATE>;
>> +            resets = <&sys MA35D1_RESET_PDMA0>;
>> +            #dma-cells = <2>;
>> +        };
>> +    };
>> +
>> +...
>> --
>> 2.25.1
>>


