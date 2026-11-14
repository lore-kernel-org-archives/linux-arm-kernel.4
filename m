Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7E0606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=neRR/B2W;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XmwQUnQI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Afzgo1aH9/cWNajhqdf0KG3GlfdAh8AvA4B0lP5vdeg=; b=neRR/B2Wbi78i4
	pxgzCnb3JtrmsSzgH5V3HdRFykrPYRxMmmXJ3vBY4+tDOm0ULMmrfR3ANzSGHWGxHh5ojkKWgsUUL
	AIuo8JLoHQXI6i0B3o71Y+08TIE+JPERZI9YRQCMIYHwh7o7nlRRkWOmrPA/V6l9/S6uTv0So5kps
	7LHeGnAmsl0BACEzqgveXVU2I8yGaQLHaIUAQGbzUl/eI275g4LMIpbhTxnytVcyWIa5q0RtDdrSa
	h4G1mztmK2gB6Ty0KysC//icoNBPLAO47x6WNeNBXlnTsVitR6xvX7x4McX/YAO60zHdg8UwnRGl2
	ew2iVwQj1R7gDKteHZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4uE-0000000FKdl-29D3;
	Sat, 14 Nov 2026 03:58:22 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4uA-0000000FKcp-2edg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:58:21 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso823619a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628698; x=1795233498;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Afzgo1aH9/cWNajhqdf0KG3GlfdAh8AvA4B0lP5vdeg=;
        b=r5inmpOpku7HyLIUEiwayEYfIqtFrhMzYhxyJp6ogEx/HY/qPKe881L+BQV/aBXqXS
         w9RGkrZvSkJy4dvyNKZsPbcOimpdwo4s84OvTPksvCoV+Sl6dMS48zerialwyfeO3Hgv
         GPljQzqQ6FaoblIX+W7QBlZWkRZIePW85pjrId3vX9P6QDn29scPOWEWrjv89EP813Zw
         7hLlASOWTvI5ZesMqMxsql1KKiYmzgKm3z4Ia6fOdv0ADNTphOAGopk37qOx8OpxFifR
         YChaMnJsyAUEBjgpZ8bezzT9iklDxDGZaVO8cwZFe9qGdNQkxbxZzZ3tLjG9f7tIJ6je
         vtCw==
X-Forwarded-Encrypted: i=1; AL+hErHps/n7vMoSvhz10yikj1QZsHZCYoJXbenUxceSF0Zuu9bEBm67onHeGNO9hpet7Lap2XxcYn7YEOlVdfkzkEi3@lists.infradead.org
X-Gm-Message-State: APuU4Z+wpbINtwg5K/SwDtGKXU9LciJbWjiG8JzfagC7vphiCG8QLosB
	brM5KZ5uy6K+2O5yWvQutEvshecjdKmIRMZIy0eujIhgrm+31pYgnjsgqqyRe4zPUQRpTb5t9CX
	gqAgMpm5iLIj29qWGYs9NHSAvPtV0G9PY/rdX+3wjrM6R1OaBc+1mFZLQ+R9Nwd0ruK0DkROnmv
	6U7cmA5DmF+7duIexcPjZW3Pu8c2eDbgqfV22e263JcyhU3pOrwE/1TaPQxRou5aTctVr8dL06r
	jAombFaBnuRJLz5vu9/qUBSLw6x4TYB5XU=
X-Gm-Gg: AYBFou2ALH0RpJjNYNOzCHUg46CyZtSd5cPyH84Sk7+oT901q6bez3TO6pTqXBuJE2A
	6ySf8pjCFpTLrH/2kh3FPVTeJh1Zoxqw3u3ieQiKFxbheQQwzaD8YF7peCjxbW4LDdIVXbSJF1Q
	otYvXblCFOBbE0KGjc7hCyakYAGHpJ8naf+PacbQNDXE9CUOkdTW2u706jkM7XzWmsbAyWKkXxB
	aWKT8mL5DL0lVbXmT3biERXP9AcoZFU29xgWNTMmpn0332/BpZiz8qBKd7WHU8J+Pc+iO9l1isY
	FpuokvnfjrMPmxUBW7I4KaUrzo/CY8L7eqWndkHGfJ26av5bSc2wzWh/OhyNdiZ6viaJcF2vMVP
	miWPxE9VmHGBt/ejP1wwBak1TA1bZwA/83NonwW/nOcx1gm83cwmZUStGNwaBv+lHV0ibJpCaL/
	0jOV8aSzB29GpwNDvi+zT0w4XKqIBh2Lua+SpxNFJt
X-Received: by 2002:a17:90b:2b45:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3b1b0cccea5mr3991533a91.64.1794628697883;
        Fri, 13 Nov 2026 19:58:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1c3e09606sm1085911a91.3.2026.11.13.19.58.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:58:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so1676491eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628695; x=1795233495; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Afzgo1aH9/cWNajhqdf0KG3GlfdAh8AvA4B0lP5vdeg=;
        b=XmwQUnQIRkB1lX/+XXdKw+I3iSLI9S8m8E/NBYaLA3pSs4m2zzNAv2Z/biklEOG0Cd
         FAMpmsUkxLSk3D3lCiRewAkrO2/9Ol1Zty4wrA6OZkW0y/J2jS2746bbvS4oqp9PopK9
         XRebArup1RA7Dx5qJ+90gGU4dafB5oBktE0rU=
X-Forwarded-Encrypted: i=1; AL+hErGP3jp0O8VrYx72VvgRkzlo32sPJ7fJf1cgyGjLlgD4XXXAlUMszWSMiUMGRPk9Bp7UPon7G3BgaJwE31MLRipC@lists.infradead.org
X-Received: by 2002:a05:701b:4354:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5030eb071mr4262712c88.14.1794628694767;
        Fri, 13 Nov 2026 19:58:14 -0800 (PST)
X-Received: by 2002:a05:701b:4354:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5030eb071mr4262678c88.14.1794628694018;
        Fri, 13 Nov 2026 19:58:14 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm13785460c88.5.2026.11.13.19.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:58:13 -0800 (PST)
Message-ID: <26f5268a-5a82-4bd1-9ea4-50cdd83e6e8a@broadcom.com>
Date: Fri, 13 Nov 2026 19:58:12 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: N18U: add nvram node
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
References: <20260911203324.104422-1-rosenp@gmail.com>
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
In-Reply-To: <20260911203324.104422-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_195819_725554_7B3A922B 
X-CRM114-Status: UNSURE (   7.28  )
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



On 9/11/2026 1:33 PM, Rosen Penev wrote:
> Add it and set MAC for gmac2, to avoid having to handle in userspaace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied
-- 
Florian


