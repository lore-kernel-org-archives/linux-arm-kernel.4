Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3510606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OoupeTA4;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GiIXl0Cr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=02WhvjwIQZgdQpPiQB/KPvgw5RxyDj/gJL3jCJh61ws=; b=OoupeTA4uySD+A
	IcQAYic0quPSOV8NNgwapHFRMXeIAY8FtKGHm2IDv1h0DZ2TkiB6skKi/TqyLBQiSjzSzvJYuFwf4
	U7XEtirmV8a2juutouIVHo8XbUCGkS3GRT41F3oo5QeHDBwEGuVYTlxqXlHlrIFisRwIOBJCdTZT3
	Q9Y/6a9caxWdfq8HtSe/xK4toVEqQPbItWJ8SelhYkaNNFlNAX0wPbSn3ARXqR5RxDIwQkiZ8gASp
	MP4a1rQcKnVMs0oA/1KYm7fYgesdE9VHvz2UHepRgT/Gxnn5Opgk7wOc4IfX7MluTPzCxgSZRVtag
	yk7yg33JBJiAJZRSuMLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0YY-00000003Pqo-2Wms;
	Mon, 16 Nov 2026 17:31:50 +0000
Received: from mail-vs1-xe63.google.com ([2607:f8b0:4864:20::e63])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0YV-00000003Ppk-0QVY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:31:49 +0000
Received: by mail-vs1-xe63.google.com with SMTP id ada2fe7eead31-745497ac8fcso1071992137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 09:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850305; x=1795455105;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=02WhvjwIQZgdQpPiQB/KPvgw5RxyDj/gJL3jCJh61ws=;
        b=uuV6MoAl2F0dAjuaa8lhbwYKLGrYRnSFNRF8pFoctlnpkgQ7mDqEptoFD6X4WDG6Sk
         X6lUd50u1qAxTCQxN4OV+ebYasEFpH4zWe/n1b8phreJL/j+8svBUcYw7lg+3GIJ8X5e
         YqQi9r9LIrOjwaCopSLNSn3WwfnnoFVz34UqpqSh6R/9KIcrJ/RVhOAEHA3rO90xfCUk
         elGxlkJBiw7d0ou85P1AOKXgQDHZr57w1eyUg2Q1BHBbGOsF5WM38AHh/PzWofN7y5IF
         yd1aUMMup7rR9IrUTfIhJoEdu/jf0SjpYfgJWOVZRfGlmn4C578gGH2GOQTypraYraZ1
         cjbw==
X-Forwarded-Encrypted: i=1; AL+hErGbl+JHalvTti/XSuMVrT+fxE6kOYjNZG9dx27T1hKXsWLP8ixmyb+d1K9Zt02z8lKXU6ANAp2y7xBQUm/z1mEh@lists.infradead.org
X-Gm-Message-State: APuU4Z9ujjIqsBHm88J4Xc+eZ8l7zeDviioB1Qfp1nfHiLV+WZMJfyhU
	fvzBKifyA9zkiKc3MCuOYJFLDEMz+l/GlEtQmE9gjIF7f4Ofkl/mUNxtaIeh//Pw8HQoMZNUM+A
	Qsr7coIVa759qhj89OOzdfBA1r5xIUKXkjYLrD+MIS124GXR/mHmqapTSNkl5bwsfMcl/X5Ep4p
	WqQgKbVfUI2MiFT/pnM4XXk92gGbHlVStcMDTmUt8Zx4Sv5fV9kkmeuCIMAG2W5D/Qckq2xbtfL
	CQAy9H79ktjgKcJ77Eel268tUwrqMhS6po=
X-Gm-Gg: AYBFou1UZL7qdIV6Im5xgWxvT/zvXOc4OAZeqehhgee8Sw3wjlRnhHDxAeo/2t42Za8
	t9/vXFNlFWsNhyIkDw5qdpKtwL6vQOVGq1JapgahKLgFpJBQrRri41cttCjTQC8SfpHRIjCUm/k
	TwpJRmjEkmuVJMfQxL5zwdNezqw7OsL+nK8nVJSkCwIaE+29BYy+k/wtCJ/A7twSsQMxABMRIQY
	HDh9bkq/jNWjZ+NZqRIWK9vXqi8P58aGegq6WtN4rsPHg9dKOmVvgywvzWEy2rpllvHYzGRfMDZ
	cFlUYJ8827aZ2xRCHX7+BW4tnptCCJix68nyzknQPL9dbhtlUqPrcimvz/Dml1oRMXTA96DJeSN
	rVlsEKw7zfVgbSAt+KM3Yn99TeLa7IK74fJbm+95CkFr9zyJT1M2/I2CwOo2ny2kKyTdVrg4yMI
	J3zugj+16qu8re32fuWnmZOYoeDQvxoYYYEEn6aDVSB9M=
X-Received: by 2002:a05:6102:4455:b0:7a7:1db6:c769 with SMTP id ada2fe7eead31-7d64d7edc49mr2061901137.22.1794850303411;
        Mon, 16 Nov 2026 09:31:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7d69df22ed9sm4519137.20.2026.11.16.09.31.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 09:31:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99076c676cbso586767241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 09:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794850303; x=1795455103; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02WhvjwIQZgdQpPiQB/KPvgw5RxyDj/gJL3jCJh61ws=;
        b=GiIXl0CrExtpfjfOVDzUXqLe9wAp2GJL885ybsX180fo4kiQ51zuK8SuzomcKGJb8b
         vy4pbPwve+KYZXqlbYVAWguKABDA09XRzq8XDIFdg/ylWs5TRzJ2+dhVRTRN8QFoUMVF
         KRRKaMqZfc2efVB3h7aHqyBpwp4wfvGg+UOBA=
X-Forwarded-Encrypted: i=1; AL+hErF79CxZWR8hkmgO/ZH4StpbbkBaJMaucSrlEfeQ7+Ej9bt4cjQ0I7ICyDPzZdTlW2a4SS7SS/oA+KJ5MLq8VCZw@lists.infradead.org
X-Received: by 2002:a05:6102:f12:b0:7d2:8e49:f90e with SMTP id ada2fe7eead31-7d64d84030cmr2982892137.27.1794850302590;
        Mon, 16 Nov 2026 09:31:42 -0800 (PST)
X-Received: by 2002:a05:6102:f12:b0:7d2:8e49:f90e with SMTP id ada2fe7eead31-7d64d84030cmr2982852137.27.1794850302111;
        Mon, 16 Nov 2026 09:31:42 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e07923dsm426460137.9.2026.11.16.09.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 09:31:41 -0800 (PST)
Message-ID: <0d7248af-3766-47a6-9150-ffebd6d5c501@broadcom.com>
Date: Mon, 16 Nov 2026 09:31:39 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] drivers: fix duplicate extern declarations
To: Safocl Stollmannovic <safocl88@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261114165612.368785-1-safocl88@gmail.com>
 <20261114165612.368785-9-safocl88@gmail.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <20261114165612.368785-9-safocl88@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_093147_191568_82A928AE 
X-CRM114-Status: GOOD (  11.11  )
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

On 11/14/26 08:55, Safocl Stollmannovic wrote:
> Compiling a kernel module with a C++ compiler results in a "duplicate
> extern specifier" error.
> This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
> expands to `extern C` when processed by a C++ compiler.
> Since the code already contains sections that respond to a C++ compiler,
> I believe it is a perfectly valid approach to gradually move toward a state
> where kernel modules can be compiled by a C++ compiler without any issues.
> The `extern` specifier must be removed.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
> Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>

I applied v2 which was not different to this tree:

https://github.com/Broadcom/stblinux/commit/0cab822bca7a59667774725b83e948b71462290f

the subject was reworded because yours was not specific enough and did 
not match contributions made to this file previously.
-- 
Florian

