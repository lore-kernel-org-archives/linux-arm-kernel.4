Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399BF606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 23:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I/yvIFCp;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QlqAR2/L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hMBEnef/2C6VY7J0rq6xUNhjJQKuBdQi9fpeFe3UBP0=; b=I/yvIFCpf1uIN6
	EQ42pNMMbptQUvAh7swBGn//sQIxRcTGFHPwCGF2Nwj6b63mD68g20LDYWwlyKDUyAAVHmqE79BZC
	Q0wSy8ojraOJZLTKAU1ZhDedE7MqoHE4OIBXwc1TxX+0IR9QyyIxV1ql1M0hMPvAkYZ5O4DNsfEvH
	skbVXxiZcv/WTtMZNIXa8hfjd5liftdtAJrKqRuBYzYVDEAKGLUA9wn0Fq5EwHy5syiC+CtKARLNh
	a5wU8JI/FMQTki6eKO6UcTzY/n9nMH5PW156V+sKujlj10dxfWFi8GdB6VCHBcY7rv8UBLf9+gaxH
	FLIKdXCEu5yYROepO6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTYl-0000000Drym-2zH5;
	Fri, 06 Nov 2026 23:41:27 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTYj-0000000DryR-1Ggi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 23:41:26 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so672493a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 15:41:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794008483; x=1794613283;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hMBEnef/2C6VY7J0rq6xUNhjJQKuBdQi9fpeFe3UBP0=;
        b=w9LdGcgerejkE0ilSMSdt3adA/v6eaDSq3BSYEPuHyDRbyxCzUhQaWABoZQJOodw8G
         MYkm+rFGcFXUgrQ87ihzHPEIuKhvXooDdICOqsuYxBV/g4EJMShjrjTwBKyOrLtPsNNa
         adbAnSqO0zLoF8WgGOOYwzFHGRtgrX/g5qeqCFN0ldNb2SnMimAHTQur1vkXJ6pXGrWN
         D2TIRFqF0uYgUjqsQuJj81Etx7hF8YdvZ3hX6j6D51sp4rbxhuEartE0p/B4yxjqTJBO
         +RWjRxBCJI58mOBwVVMUK4lcYE8ww9xF3q5f30wd8yXIv87vkzgux2Ni+7maB/UMKzU1
         Xa7Q==
X-Forwarded-Encrypted: i=1; AL+hErHQj57N0Y2GhExeNApqztWnGhYqAJ+OX94GPpdICpbIXDV/ebFWRa4GN+brrk9SUQyhKbgHv0TV6q5WdK3sKb9i@lists.infradead.org
X-Gm-Message-State: APuU4Z+wT4JBlz7FjX67sFuX+GD3kVDEwwAF8eeSqSBPnZnLLZ5ufM+5
	xFr5BH2mLHVpbc3junN6j2mjZnCdwMRTH5O9ec4yngrOWdWZD8CkH7vugb3iU6QtHqiytNNiCcN
	F/5dmgfKqWrL/9dejiRvLOM8GsMACrPnAzdiS1UUzd8rLyl7R+DHJZo4SFqLMX6x+VJuWHBpM+D
	TSHI/iouThIU34LyqbmpvxfJW3RX2KdhQjpRxeYscpFBVgRxs0+oWG9TYdIblEIkpCNuhcwVDsZ
	c86B7iDULlmm+DAkL+DRirdDhKh66Svw0Y=
X-Gm-Gg: AYBFou3G974Gm9xi7uH0mN9h4f0Q++AnAwbWWlybtSIrb/JCoSOQeRfEOJGsyiQRFTY
	z6JlH3Dg7kOAqwky0Fb50L8g7mFlO3Iri/HcYOxLRiAodY38PXXW2woy35we6sPm2cIILjY5CiP
	H+QugAhk9d8pBUTs6Qm/pim3RFRSSUaVwOEzh3hlmU5G/qN1iR8hrT+HzHKcDVNV0HllvWO+eGJ
	YwraLj/QACVMlKTlJnmYA6bp02DxT2sfhabkNZggQaJkw6YFe3pBjc/trkDL/IVaXbpKU0ZzjEp
	t3xPVgxgCgnq/hM9Y/F4APJlpijBfdYjin+ibJrvliF+IlKO5cdtWxxMsABlJbhTjcIsVRu8FQe
	MC+PVwHSkmqPS+HoyxtYBVaCKlxcOHHYJIGDPPTcCaeACTyxNBQMEGM9/Md2PbzZpgxcTFWwW3I
	UkIKrtQ/FoFb8VaFTY16dcZx5wa014Gn+Bcyp0VnI0
X-Received: by 2002:a17:90a:d883:b0:3b0:9e2c:9b61 with SMTP id 98e67ed59e1d1-3b0db706c32mr4262745a91.35.1794008483177;
        Fri, 06 Nov 2026 15:41:23 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b0fc47d277sm321514a91.1.2026.11.06.15.41.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2026 15:41:23 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso2379434eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 15:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794008480; x=1794613280; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMBEnef/2C6VY7J0rq6xUNhjJQKuBdQi9fpeFe3UBP0=;
        b=QlqAR2/LN2mZted5/9gIaethEHekgM7fUrc1sDkK49YdDuKkT2/84UpUTQHCtUjQRU
         dDYQ9hfnzclcOt9f2iE7ifn0sjA5fDXw1ZXNGAbNLnRmBUyZHwDzzuXwLBZQZW9+zkJT
         KYb5uGbxXd+Y1fiQCGCQaWvaz8rGUxelYdBZA=
X-Forwarded-Encrypted: i=1; AKwUvBzY5PaVQeaLS+IfrSnrYPXl+cP9c1MnUV6GHGtxeI4ZNH3VRzVoiC/CJtY2V9Mzj99iHtnf4nFi5KqXv1voXikV@lists.infradead.org
X-Received: by 2002:a05:7022:f101:b0:174:cf1b:235c with SMTP id a92af1059eb24-1b25d38507bmr4463656c88.43.1794008479834;
        Fri, 06 Nov 2026 15:41:19 -0800 (PST)
X-Received: by 2002:a05:7022:f101:b0:174:cf1b:235c with SMTP id a92af1059eb24-1b25d38507bmr4463610c88.43.1794008478957;
        Fri, 06 Nov 2026 15:41:18 -0800 (PST)
Received: from [192.168.1.179] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4d36efsm9170226c88.17.2026.11.06.15.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 15:41:18 -0800 (PST)
Message-ID: <0d59cd31-909b-4ed9-ab86-ed6ceae6ca03@broadcom.com>
Date: Fri, 6 Nov 2026 15:41:15 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
To: Jiri Slaby <jirislaby@kernel.org>, Ray Jui <ray.jui@broadcom.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 Scott Branden <scott.branden@broadcom.com>
References: <510bf9b037c522ccfba270926c95170291115ef3.1793602003.git.jirislaby@kernel.org>
 <CAJ8Y1dTUmFXTHnoPuYMNKULVdaQPtr4S8OiCqhHKZ05WeyGCFA@mail.gmail.com>
 <b9537359-9558-43b3-975f-de2a1017e463@kernel.org>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <b9537359-9558-43b3-975f-de2a1017e463@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_154125_419603_8724BFA1 
X-CRM114-Status: UNSURE (   8.32  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/5/2026 10:09 PM, Jiri Slaby wrote:
> On 02. 11. 26, 17:20, Ray Jui wrote:
>> Thanks, Jiri.
> I am not sure who can pick this up, I tried couple of recipients without 
> much success... I give up resending this for now -- you will likely need 
> to pursue this yourselves. Maybe feed it through some your (broadcom) tree?

Yes, I will pick this up, thanks Jiri!
-- 
Florian


