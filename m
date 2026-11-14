Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2005606A8A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P2vXaH2v;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DIwsGFUt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0aFiTUHaLTX8K/bOcttDkw3JirpRVRPGu7AleeYbx/A=; b=P2vXaH2v/cnooN
	LdfQv7P0UcV2tS4NyNjZgtF877yws0JrQPNPfSrG4jVlw+QXuWfjG7BTT5ma2Tr6kvIJ618Eua3VF
	yxI1sTr2EdIHgq0DAq38z8tLZTmK1smtZf7C3I9L5RLOR8BORZvPxIE+Qe4+yrqnwYSpwTJ51Yw0T
	ruU+1yQXyecf7v17v4eO4zziOHfi7zwM/BcYxk/bVMU45pHda9h6yQNcqSAWt3yNE/pPfs0LarPz2
	MY572TzA7cVubPScTU1pgoQUKf2skVG/IFGfz9bBk8ALpi6iIfrYwJ1/IVbXeSDcFqJkqNa2InpGL
	QBrgANv55fB0XKHOqZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4RU-0000000FGOq-16Hp;
	Sat, 14 Nov 2026 03:28:40 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4RQ-0000000FGMx-3vK8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:28:39 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so1349570a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626916; x=1795231716;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0aFiTUHaLTX8K/bOcttDkw3JirpRVRPGu7AleeYbx/A=;
        b=ot17QgLhO0JMaD4r1/tLmDe6b2hkniaeeRXE78rVX68bdWCZQylEZ1Qi+lX//oi1eR
         uyWafmjJMAwmNoBJB1MPdodakjeZ4UY0NvLTz67G67Y32w4zm2qGzMyYkTjI4UKqohgS
         gBxNWtDv5IImFEQMHuw9/wDLxEd5MJ4A7SubQJt7vZ0ehEB8SUwvAEwlPM2cVAABw33G
         zL3QJ0iz826BFsy1A8wvBboKY5TTFfr9dcbdCOV9iHQmd7kGBHTVHaeXr/wSTaVZVqER
         FFf+8IqheCWTIzpeeM5XxXVVNZDp3+kyyGOzEwtYwVnmfHuIFD2AUpOQDT428uvSsCw/
         Zf6w==
X-Forwarded-Encrypted: i=1; AL+hErE4yjS+kyIu8z8uQWI8DtQxw1z51xMI/hersQ8YLxyNJ95cbedEwtTwd2wv/GV5GknrWIWBB5JN7sn94xVa9avm@lists.infradead.org
X-Gm-Message-State: APuU4Z9uSXA+8XdR0720c+OH7vwc2gRJXNWBrDKavpELbWEzaRBKKyGd
	3Vdq2smQCkPRDkouZmYveUlSjzasEBZsvDohWrApix9bIMsQqwq+397OctOZiPW9m/Se8FHyiFj
	yNHN2rLTttG7X7Htkua3/l++2zpcu9R8k/UHF+pYB8gBVpC5rk48oOrC7/npg2foCUqpzzG2Li+
	H5Tfv9cGYtRTO0//SODQi+xXd3NZQTKRkTK3RU4NwzJvMF2YmwQI3IzRBJJSFUhrO5vgQwDWoP7
	u5h/03XXVNRQIhnhueXffemeqJYChWaT+o=
X-Gm-Gg: AYBFou3cEaylCQJpRbrdUbquT8ce3MJ6DZ+qSB2L+Wpfdr1hvuz3qw+55Rbqu0Q5WkK
	78lwvROdTNGrR+54BC9zObARhWt04DjaZ3GzrLiutarBXEPzEM+84gMrARQ1unET2zMZmH88LDu
	brj3t1or/q1DwiQk8PtCpUPsBM1XrU+TDBK1JjNLGODXaE8Sr/REuLel1b3xUQldcoTp1IX2LR6
	JGlK1OrWgerAQNLgpG3gCu7T56yBF7yjtPt6XEsUzgBPCZazFKL0JTqMu9WSvBT2gqc/qXx8ir2
	SO7pHohozqKZAiYmwm+slJ/gquIEOB1jqp1k3dGfej6XSEnoKjLo3CIdrUlLUpO4F/cg3iJZB0H
	w60ZrysKAWcDOnm9LB5EzQrokFRVZxTI40bi5ui8zMrR3g6lMtM7r/Uy/L0E2Iidg
X-Received: by 2002:a17:90a:908a:b0:3b1:bee2:223d with SMTP id 98e67ed59e1d1-3b1bee22478mr1758486a91.53.1794626915951;
        Fri, 13 Nov 2026 19:28:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae8da103sm6512969a91.1.2026.11.13.19.28.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36fa5673fccso3801922eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626914; x=1795231714; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aFiTUHaLTX8K/bOcttDkw3JirpRVRPGu7AleeYbx/A=;
        b=DIwsGFUtFRhLbKHETDOQl5b+ooia8qWhhBUXtKDrE/rH4XN3+R5IzNRZ7U2KYZqLGU
         2oHfReLKnrylVWlTHqyp+4DAfuqYz4nPt2WactVsfaiiKRigHbEjFOggHFmunlSDy/dr
         WNnKp0b7xLVuN6lB4e50NPo3PUKQ5l8VNLieE=
X-Forwarded-Encrypted: i=1; AL+hErHCwawXcjX+h4TWrVhN7ayUKnHHB4oZ9e08yIgxDjdHLGiIVZ9T8+PvX798GY44qwtVAg7jYzn94PNutOmmoFDm@lists.infradead.org
X-Received: by 2002:a05:7301:4d16:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-379675feb32mr4186731eec.29.1794626914295;
        Fri, 13 Nov 2026 19:28:34 -0800 (PST)
X-Received: by 2002:a05:7301:4d16:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-379675feb32mr4186687eec.29.1794626913548;
        Fri, 13 Nov 2026 19:28:33 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm19491820eec.8.2026.11.13.19.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:28:32 -0800 (PST)
Message-ID: <ae30799e-e027-4664-863d-aa0ebeeb05ff@broadcom.com>
Date: Fri, 13 Nov 2026 19:28:31 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/11] platform/raspberrypi: vchiq: Store audio device
 in driver management struct
To: Jai Luthra <jai.luthra@ideasonboard.com>, Stefan Wahren
 <wahrenst@gmx.net>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
 <20261112-b4-vc-sm-cma-v5-2-d25e3b687e71@ideasonboard.com>
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
In-Reply-To: <20261112-b4-vc-sm-cma-v5-2-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192836_986712_6A7D4DA0 
X-CRM114-Status: GOOD (  10.75  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/12/2026 3:18 AM, Jai Luthra wrote:
> The VCHIQ firmware devices are not discoverable, so they must be tracked
> manually by the driver. Previously, the bcm2835 audio device was stored
> in a static global pointer.
> 
> Move the audio device pointer into struct vchiq_drv_mgmt instead, so it
> is properly associated with the driver instance and lifecycle. This
> avoids global state and makes device registration and removal follow the
> platform device more cleanly.
> 
> No functional change intended.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian


