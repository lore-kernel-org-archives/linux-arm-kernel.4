Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB2606A337
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XGtjt+x5;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Snryzvao
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lylGBZzawup/AWIpS5YFKvFiPE0Bmxf5IfPeVlOTz+I=; b=XGtjt+x5q4lcLB
	AvBlUn3ar9wucksp1aWj+gWgQouHUuYPzEYasaAZoibIPuL9K2b5enW/vYGKRuAuTDa3JrOTH38Wv
	llk8ZzQcMHN77aqxf6mOHOXZN+QXbsjGtVt6a456YxvSLR1ac4aEYK/+41EHZZorpmr+wxQMyRa/O
	S89iAKqe10cwSwX311H6ANmNWaZlOWUMSEWGrCrO9P5z2aC+ksRBCpocILZ3dxylDIJUiO9Bspxir
	CbfAreAqXBuZEVXPCJT/+k13RrP3N3F9Cd+qZuxClu0st22aAPUGSg8s60fLRo8x/y1U4Dxd4piFy
	tMNlbYGGRP6FG1l0L+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4vY-0000000FKqe-3cvy;
	Sat, 14 Nov 2026 03:59:44 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4vV-0000000FKpu-2wVF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:59:42 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so694678a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794628781; x=1795233581;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lylGBZzawup/AWIpS5YFKvFiPE0Bmxf5IfPeVlOTz+I=;
        b=a+FfaqRP6WdddxDJghwO224NMuZhY7dLsvc2UPuM9L3ZurIV+0V7TLpHLGMfJgIjlU
         FgnhcklvAUIvCo6QlX9HtUdHB3JzTjwBnLx8HWSGm7fVdkU86h0OLqMfC+pQnzz2xefs
         qMlbC5MnsmrTV/xsRpIWM3ZZW7EHEHbAp/BN6xJpmCZniLaK/RaogiiTiczrfcCJQhbX
         Ra3GVWCganAWP3hLnfDLtW2QVPT3QBxZ/NLnoEuqzdp5hsg0tjqFEriMoDFkEI0wemuo
         IAvjWlbIlHoxuvjkfMTzhHRikxVrFiia6laDl55nt2nwP9FqzlBaU5iUlNRru/TLhFW5
         XXFg==
X-Forwarded-Encrypted: i=1; AL+hErGx6E4o0I8bwX9M/IKxvxIprfNOfH6/UcDv39ltzx4kSPD9ZL3YFVAcIUCNTTPiVYjhjfe+jxh44/1b2oP7fD74@lists.infradead.org
X-Gm-Message-State: APuU4Z+L7lZRMY2hHTcnD4n+CheA1R+m2X5vHVcW1xjnk6pawPlmgdh/
	bou0YC8oOXNK6mPychHUUn1Pby3BrjRQRAZ5+F1cj53s8n8kfJC67/E4YkK24NEfa+ioCM+k0M0
	pv6xGV5t7UtyedPa/CiJlMHD7OCKNrgnt+CuUFYgPbH0E5W/SN2pNHxPvlP1l0NmeP4CbiKf64v
	ehL8GLvRuAw+IL5SEudxtYPR8AzeuPTOQbLlbuw8bJCPPux2FtPz8rKP+jvBQLnvuEhOeTduy7h
	EGl8QQFF6LgZ7n2D6U2bulgKd92f5CC8S0=
X-Gm-Gg: AYBFou3nLSOMWjovZ95hb5BZXD9jXCMpiMdIFkPti6rq0Q9HDKnymxsgfyXJCFhXFe3
	Jet/LjNLqzLm1sFmM7bojNM/jR4F6yoFg0snGrKVvHRP6WS4mjHPR/gkhe15beo9QPeb6/K1H3f
	MypdinRkPviond/1tW1HWrQJt4xE0Z8ZHL9gKRRps0A9QR9tbhcuaaI6Cqj7Z1PN7O2euwjlQKU
	5Ng5p6sDLP2bJPMWqMEJO/b8ayNgqFf5iW2JVq7Dov1KJ9YjL6e0SlDVTIWrPaSOWmep9App9xY
	Az5cCgCvBEBrgTCbvO28EPS2rwENYGJVrkGcH974m/P9VNt/gt2eXVz3AwDGnUd/FqMTAvK4oRx
	Qmu2D3lJ4ub/UHzyt1o+MaP3PgmTLY3bXD11mxAIi2rbzw5/QMDESRec8jnJAD+RV
X-Received: by 2002:a17:90a:c110:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3b1b0ccda1emr3635943a91.65.1794628780793;
        Fri, 13 Nov 2026 19:59:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae97e783sm6639456a91.6.2026.11.13.19.59.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:59:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so1914708eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794628779; x=1795233579; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lylGBZzawup/AWIpS5YFKvFiPE0Bmxf5IfPeVlOTz+I=;
        b=SnryzvaoZI/gg+HBdcHyjbS+HARS3yZaau1RL89LR+ESdYSNltZP48ugQgLgX2YQcC
         4NjJIiAt6PxP+AufDtKTDHHWeO1Ev80rtyhJUNNXmOgPcNKrneBWYidwEQBhLEdtKJHI
         pEYWCUbcFsZ2t8OAXYQ+5tNPAfKMSoO9hSe+g=
X-Forwarded-Encrypted: i=1; AL+hErGAcY1HqwRxLyEl7jfPs+9I8uNLKSEzIxVu8z2lMxcqCUMzHe0To2+hefDto94AoG9VlmUREhPN6puOfb+sb3vr@lists.infradead.org
X-Received: by 2002:a05:7300:e9dc:10b0:369:f9c4:1fda with SMTP id 5a478bee46e88-37967ae8705mr4719415eec.27.1794628778831;
        Fri, 13 Nov 2026 19:59:38 -0800 (PST)
X-Received: by 2002:a05:7300:e9dc:10b0:369:f9c4:1fda with SMTP id 5a478bee46e88-37967ae8705mr4719367eec.27.1794628778162;
        Fri, 13 Nov 2026 19:59:38 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm18028089eec.18.2026.11.13.19.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:59:37 -0800 (PST)
Message-ID: <8aeb2baf-5379-410f-a86f-a94c4c601a71@broadcom.com>
Date: Fri, 13 Nov 2026 19:59:34 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC68U: add nvram node
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
References: <20260911192012.81280-1-rosenp@gmail.com>
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
In-Reply-To: <20260911192012.81280-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_195941_751533_C058E48A 
X-CRM114-Status: UNSURE (   7.16  )
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



On 9/11/2026 12:20 PM, Rosen Penev wrote:
> Add it and set for MAC gmac2, to avoid having to handle in userspaace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied
-- 
Florian


