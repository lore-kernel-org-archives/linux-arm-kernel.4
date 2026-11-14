Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C127606A336
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 04:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1BsW3cD/;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZFIy0sQ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dJrTH631TyOstG97Yl7r7XDNqbCGb4beLO4O8KmPNE0=; b=1BsW3cD/ayeMda
	Qx8l2XCWZJ2YvXjReUSfkW9iTlZl1aukOJJpmTaj4YANY3Mliid/6hxyQ7ycNTk1AJpdaksPi+j8E
	SbGK8ZXOjg+hfU//ncvDSMLm7UEItdTl91ntgaewzyZ/kFvtLqK6noS3+HYSYLYLRhQUY6AVevlkT
	Q4S21y2PeNFDEIoG3tey4NW6ucpxBTG2oVMxhXKvloSQeLuPOiD2usisr6ikV2A6yNq/HAzWJmYq8
	M6T4JEraeFRACLfyPBt9cP8ASGBRrlk2qLx22AmGboGqSoFGJi7sGNWKz8GW9f6w+4YfYYSt08WuX
	KvgdT0Pmbp2n1Jl251ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4wD-0000000FL0B-10BJ;
	Sat, 14 Nov 2026 04:00:25 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4w9-0000000FKzH-1edF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 04:00:22 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1390533a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 20:00:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628820; x=1795233620;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dJrTH631TyOstG97Yl7r7XDNqbCGb4beLO4O8KmPNE0=;
        b=HaZVk8f/lcvC5o7E+BivpcR6pqmCgQovparMrkm1dsWcymKTxOXVTusRyTQWJv2Dlb
         EYDyz3DEuuS4tFhYv8qNxssmmA0/aEK9vNozdKJU0QSVV3ZGstsLGYE3M65oSEEEk4xC
         YGQeC7+fvYfFFeG6KwLhRJj7AKl3V2OcHRTU5FNAML5d/FxgViXcYFvVk4ygtpJ/LD6/
         iwtV5ZEaulX7ftzKXt5wciNK/PVCijHfolr/UMJ6tvUguwKF6VN88HWf2aH82UWK7lMW
         LAveJIArhoQysRPBKZAKRXNJv+yX2wRaJOknulRCzQYwb0zaRPcxSP0mc2fhJycx47Kn
         Qk8Q==
X-Forwarded-Encrypted: i=1; AL+hErEUUgod9YoKUfFG0KkK7hBQrtXFlvm6MfUsLqYnwThVOO0YerxumhsaHmaKWSnrnpSyjCXqlkodi8eM1Bcb5lFD@lists.infradead.org
X-Gm-Message-State: APuU4Z/XSuGllMXc24BkdCDEmlWHm/gqTXsohgXUuYR00i2MEfHPGok0
	hXxIhTkPxVCc8bvSulROiis2a8NLxTmbfDNxJ6MAUeO0MkKwIksY4RW84vbeFusFAHK54S8v4pi
	JfpJT9jNZfOXzL6v8YKVv3fK3J4HhVpuOfL8z5TvRYzujUKHdlH5Cwwgm+csv+wh7dZR4bL/jKm
	KxBjbI8xylesT99bEOrsKFFlVl/6GSEkQODBV/suRhIqBRyGUPvbq01osFuWqiKalwas5h3I4Xn
	JT5JYcM7xOZ0zRBkMrWp8fgLQ+xnrP94Bo=
X-Gm-Gg: AYBFou3uiIZ4kZg0ZRg/6UzaIrHWwSc8tVR+eh0AEUi9uczdahocFGgOWVjeyyb/GVr
	Bf7C842onl88KSXEYw9yQH5kGGFbjCNa1xyhHpqOTnr2apVOFGmHZh4Vkw8r5OeO6bGT9PfEhTU
	u3NgzvToSIAZ0fWEPJxAJWY5PWAvNnlp1EGgYwSPUmG8532KY7tWKE3vgwIJ7ZRpxVxkoOinwHP
	iSU1PvhbheF+xBoZ8H+t5f2Gb3AwZyB1kbPJmKUebRQpULsJzeAKVBO0obPbOIipE61mMjcRr8s
	Gf1NRhzHPeRRXFHVBGClLw57oBo5SIGf02O/W9BjvfdCUDOo45Rav2z63WLxulrzR3GLPxurniC
	Jhv+raB1tgka94TL1XMisosO7ZSzbVzgHGfmJhM38E+vtZBNIqLa3x85ZP/m3CE9Oe9Ej68/1W9
	zxKaLTRBw34GxYyT9ND2gSToXMnysnYP3z3xkqvNO4
X-Received: by 2002:a17:90b:4a48:b0:3b0:d35d:bb86 with SMTP id 98e67ed59e1d1-3b1b09f3f22mr4294021a91.15.1794628820403;
        Fri, 13 Nov 2026 20:00:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197ca0b6asm8945968a91.4.2026.11.13.20.00.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 20:00:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so1052810c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 20:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628818; x=1795233618; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJrTH631TyOstG97Yl7r7XDNqbCGb4beLO4O8KmPNE0=;
        b=ZFIy0sQ2G9cHDoS6ZMP1q1D1bRtQII7pIMNTJKtVpAt2g51Ava1vkUaXt4SG9j4MVC
         t4ndiVbQfkQtbZdcERF1BPyJ0KYq24t1OW1SaX8U1fXi0KfaiTnWVpWMz4qEK6iUYrHg
         Dc4tzugvLwm5JhXvq7p5omss/IjPaayGm2PsA=
X-Forwarded-Encrypted: i=1; AL+hErFTAus3lRR24qLMrSD5zb3xJcxGdKUHzdgUNIYvrFIK03ql9kHdhQPkJSbUvejtHKPNm4YRO1GANnhSfeReDeQb@lists.infradead.org
X-Received: by 2002:a05:7022:6b8e:b0:1b3:a05f:8929 with SMTP id a92af1059eb24-1b50317ab17mr6582012c88.39.1794628818429;
        Fri, 13 Nov 2026 20:00:18 -0800 (PST)
X-Received: by 2002:a05:7022:6b8e:b0:1b3:a05f:8929 with SMTP id a92af1059eb24-1b50317ab17mr6581961c88.39.1794628817562;
        Fri, 13 Nov 2026 20:00:17 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f01d68sm11737395eec.17.2026.11.13.20.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 20:00:16 -0800 (PST)
Message-ID: <8518ea1b-41a3-41ee-84af-7f41d8298799@broadcom.com>
Date: Fri, 13 Nov 2026 20:00:15 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260911191823.80631-1-rosenp@gmail.com>
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
In-Reply-To: <20260911191823.80631-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_200021_441230_1B38B63D 
X-CRM114-Status: UNSURE (   7.18  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 9/11/2026 12:18 PM, Rosen Penev wrote:
> Add it and set MAC for gmac2, to avoid having to handle in userspaace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied
-- 
Florian


