Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C597606A893
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EZog0m/n;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gd8JTA2D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5jsTRYk7KQN7825qF1InYK8P4ki41DeOjAFowmky3OA=; b=EZog0m/nvZfdjD
	ILxWeArED17zpLGk/3Y5mVSB5hYjPS7XbOP9JazL0g/mwxuiSgJwMKTvUu5t1tdnoCyA08AeZ9PmK
	5OHFJardZaW4VLWP9301q/pk7tG+FsC0mwTF3qaKMZ/GdoZ7pOngwn5xX0UfKRAVtRbn+FGFOsJ/f
	0QI/4rf80fW7TjaYV+y+oIdySk8ggTYvAZ7sne0nbWkZITWcA5CEvZbgNgf3/yE+EUolT5yYMll3L
	D0P2sNKN+D3x4qiRbsV9r3aF5qXQazGimFaZfa13PqIS5eDYJvYkE0rB4EztR49ErsaRFU5alKqL6
	ZC2uMLlaDHCMm3ZE5V0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Sv-0000000FGuq-1oqF;
	Sat, 14 Nov 2026 03:30:09 +0000
Received: from mail-pf1-x461.google.com ([2607:f8b0:4864:20::461])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Ss-0000000FGsY-2ILL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:30:07 +0000
Received: by mail-pf1-x461.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so717318b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:30:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627006; x=1795231806;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5jsTRYk7KQN7825qF1InYK8P4ki41DeOjAFowmky3OA=;
        b=UMj0DgQrSj+WJ2XOho5ZnOrqeQJISNKrxUmSVwK3Fo6QSckKFoG6hm+NAyjbV+U2Er
         KGNue73MgYqLjxjVPiYkErlSCIeMN5IjnHAojpTnTWqpmsirj874idYlEY4AfwGwXT+v
         PZMJGd9YLON3ap+D46we+cGlfA5ivDUTcxEdDQDKllB+QvgSYR5D8zwEmQYpl7KHwDJo
         xt8rjrliOJ0rjtv6IrvUHyLtpjaHA+eF2U8VsLPQtr5aRFSVktFJrjL3Q69q/9LBnQ3J
         2uzmjG3JitKcujnbPkulFpIQhaU9hYHWh65fUqz23aJyECF0Nw3PN9ImWFxvEET1EbA6
         X8kA==
X-Forwarded-Encrypted: i=1; AL+hErHv/Ic/LM/OGal5QFm1RMql49YNQHqjHsMKpcR4ltN917xAMeRfFXx/+5p/8tlJJ72mxx5+rtsx59FAUsbtnUJo@lists.infradead.org
X-Gm-Message-State: APuU4Z8QuqZK+RQtXBeTmd1VrTsM4IzPLxcrFMOW19QzJZjkVyZF9baH
	uVrp45lpbvqIjGhzDYhSbLecZscGu6McPuIlkoVVLnn70NuzHRvxfCYWwPFCyI8pi7lZjp6vBvh
	zVnQsy7bPdcl+yN9v6qwJ7rLa0xLZGTNhvB2o3TqlUSKmDGUaUMy/obhfF2dg70eYcofQf+2zbO
	U2rIrsD2X1OuyV9r+QFzV/VNEUTluWkeNYJmJArRE4L54oBIBmYAQG1sYD20YH+6ToXSGqI5VyM
	Fz9kriOK7pKH9SxdpLA0UeqCjzLwq+yb5Q=
X-Gm-Gg: AYBFou2LB/ZNAL2FRFTDyZhhov0VWOnUReZ6wygW6WPvC3GXEWWLk7xB8uieods96kx
	LBNsaePDFa2iWU7uBtDBKG2zwFpNU25PRuWJ3lzmJnrrvIYC5tmXYZwjCQ2ccFA8S8akIGQbbKO
	U4odjrP7CINljRAcP8tR1HPIHVD7NbUq9NBELcuG6NP4gqNbU2ytfXUbrcT1d40jOdsPOANL3hi
	/B93ni3+45KkkWz1Y+7XpHWkjWpdmysSKTzj3NAoXI19BAniamSgqjmNWjO46l0Zl4UDzKvg8ov
	alul06FlpFIcVvEyo/J2ndH5IrPiSdTeZIffG3sub/qSDQyDnfSlJJelF5Zv2jZ8/ZDdynXfbKB
	DRVGA9vxDxslJIGbZwGHtjxLQn3Cm9xTkt7o+Ln8w1VtS+/59ppFQv5xG9sigaz+LsE4X6dCJDz
	JegKMrd5GGYAuAkFl+MavQThkfZ8XFb5EdSCO/ov5N
X-Received: by 2002:a17:90b:4a48:b0:3ae:a531:4e73 with SMTP id 98e67ed59e1d1-3b1b07ef468mr4367967a91.7.1794627004968;
        Fri, 13 Nov 2026 19:30:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b1ed0b73sm3135181a91.0.2026.11.13.19.30.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:30:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so2006235eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627002; x=1795231802; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jsTRYk7KQN7825qF1InYK8P4ki41DeOjAFowmky3OA=;
        b=gd8JTA2DUW0OFWu+b7upYH+2wdKGkc9eR04RYHqV79gVN4jcobPJTsH0Smk0gTfPUh
         mZAeoOwlUwCmbDhus46LOW1HLjKWkoIzV0VOJcAL5P1QvYp+YAgT743OPkZEQVyvnxfi
         PCYpTUZcmgniwBcuqgi+mIr6ttjuIOsMmg/oc=
X-Forwarded-Encrypted: i=1; AL+hErFIsb29z3DkF19HBwH9h7tXLfoKHf5ocIb2s3u2Cl5i9U8gngJmQkIdCO9LBek9/RkbMtvhdfhIk2gGl6N9Ykpg@lists.infradead.org
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr3674707eec.30.1794627001859;
        Fri, 13 Nov 2026 19:30:01 -0800 (PST)
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr3674674eec.30.1794627001180;
        Fri, 13 Nov 2026 19:30:01 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm11295736eec.16.2026.11.13.19.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:30:00 -0800 (PST)
Message-ID: <68e0e1d1-37e4-44c5-9830-dcfcbacde762@broadcom.com>
Date: Fri, 13 Nov 2026 19:29:58 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/11] platform/raspberrypi: vchiq-mmal: Support
 sending data to MMAL ports
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
 <20261112-b4-vc-sm-cma-v5-5-d25e3b687e71@ideasonboard.com>
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
In-Reply-To: <20261112-b4-vc-sm-cma-v5-5-d25e3b687e71@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_193006_586500_1C42487D 
X-CRM114-Status: UNSURE (   8.43  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/12/2026 3:18 AM, Jai Luthra wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Add the ability to send data to ports. This only supports
> zero copy mode as the required bulk transfer setup calls
> are not done.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, 
thanks!
-- 
Florian


