Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74883606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kAfo48qo;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=c91rAe0R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qZqAnvrKTsVRZ3k+qpJ8SHuObdEj1UWG4cr1fECpUNs=; b=kAfo48qoZV75ij
	zF2XSgT/lSjShRtmE5Rs75mv3ENO7lyl7kOelEWUJ4meBmnzUq1/ZImOcRGVoZwZ/HVU/BmJf328y
	u5+5LHQO+uiJKuZUXbTUp+iF4e3L/e7vCt/SBr/Lb/ZmnephmG+E2TrKdUDNVA4/rJXNypDiy81Ss
	0UzajZ730ZAzaMCn0dcTFHfAy/sO3Uo0bNXPrKoE9Jr94mCLZJPWj54zcYjuQghLgS2hl1xzkR4GR
	QKPNNiQTH3CD+dMiDpUGBABjHtJiXzT9wjQi0hiK+ezq2hRq7jBviS27RsBpHAWxex5q1HIOzAa50
	xcEUltvJYdHrX7OZ1CRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTemC-00000008qjG-37yz;
	Wed, 18 Nov 2026 12:28:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTem0-00000008qWz-0Uxh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 12:28:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so9362145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 04:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004902; x=1795609702; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZqAnvrKTsVRZ3k+qpJ8SHuObdEj1UWG4cr1fECpUNs=;
        b=c91rAe0RMFu6J5Cv9LDEkusyQ7z5B0vYVjHbXgucWirB30jnRpICePYa6zUTSeh0PZ
         yfnqbmgQkkHyY747Vi4QINW+BoXUt4dkfgmGrAxKaOjZvCaNgxyAGu8qgqxVhN1HsQHP
         tQzzVzP9vkq29/I4qtQvF74Pp17ZPehwyuP0RrMAnMMgJuSfoB+9TZuZN3mtClGaKSz4
         tz25zf7wlckyrNgsz7yQhEDvirQYVPfm5Ma9+4klxl2pObY0TOX0Ggew2gqPVwZRjTpv
         LCxMczugXTwl1T19r3zOlrUJqxSY5p01RFKRP93tWRduuTvZgIk/WDyfJODJmBIoJfUF
         sS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004902; x=1795609702;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZqAnvrKTsVRZ3k+qpJ8SHuObdEj1UWG4cr1fECpUNs=;
        b=xfASy7mmJshJaIYz0d9I02U6paYXolLwDrmCeTx7ncFLm1buTnGIW98AhiS9TlvA87
         xKWKjuIHm0aKCEJRXEKEoEgNLf/ftk7MKidEX1UzdkrmScNpCkOQqtHdhdC4dKQeZhof
         2waB3gV3Shh12UzNx7ZR3w+Lg9lUuiG6RtLs9S0pZvBWUpqBSPh2vIeny0jAUc0d0wVf
         G85yWoWHQGVBoDeyM7qP/mjNQ1yKns8b5qAJM34sLMUmBhP/p/f4Z5BL8C/Y9dvFU15X
         krc16bPKQE8lBGUBu05KIYV6lQgEtd5aA4TflZ8IuUA0YaOIk75p/rW5aO5IiA7RyNjT
         qFFQ==
X-Forwarded-Encrypted: i=1; AL+hErH4POXIdoGzDWvThNu7cqb3PuR96tGQbPUoeSikwsQct7wEkgAJaSbyWQTIgGnNfg4Y4c/z0TweIQkl1C3NvDsx@lists.infradead.org
X-Gm-Message-State: APuU4Z8PlJaukj+Rqr7SQjaSWBPASJ4b4w+REor/ovLY1jBK7hjHqOlC
	3VrwGe6mU03r+3z1hO0usGk6mDy677roHpOQJfki82T4xWdmqrXK/hMCEQTaBo5zGpQ=
X-Gm-Gg: AYBFou0Eo26od7PgE1ulRZ9J0CITdZVif6FNT8cwtjuRn5mCTcjS9GQZDTkWstjBebJ
	528FOQebK4A3A+Q3qZV2Ao0M0uJYMskPr3YQjGSiJKJU30laKj5KvWEiG2blUlhQxHeFj+Yw/3+
	zRraPqdH7SkTbo78VXghXMJDLsuOd9NtZxhoMfK36qTCU1XbGp1fY9KQIiI39SGUyIJPmHyN08l
	h0eqcu7NXlbBl5crX0xhzN6C56pw8XoVs4+wuXFq62iyGvdMrsctlh8RLl/nQ+djbABheN4iqfj
	xJ9qCyDDlPJ4Md8FF2vGHJ+CQng69+PGasH5PLjeR1EouCsR7x8hsabcutGULsDDfGmpFEMU3yL
	AJDM5PIjDlFHuU8pZXGdLQ7czhCImjp8oYRIwgqK25KnsRO83nEIqTyyUkobnkBqDSIHbs+h+hd
	NiuBTga4fhnL6T4Xj+E0YhQgTw70nOTmX83tv0bCmmWGdyQWnDsFfxS2keBPgpsQqdbtI0VkEw6
	nOTQIiNyEGJ6J7Fe6+5enbP2ljt9pVj09pm5OxVSoiUooa8CZfHIgMJypV8kfo8nY5wapRyuUcO
	r4D6qBKyn21ooYVUYRv9SS5eIfXQAuk9Ez3OpLRBGYoVWfEw97wuPqcMjj+VnEev2927IrMs0iH
	O+A==
X-Received: by 2002:a05:600c:34d2:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb7d6d1f21mr46698525e9.1.1795004901817;
        Wed, 18 Nov 2026 04:28:21 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2abfc4sm64858355e9.7.2026.11.18.04.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:28:21 -0800 (PST)
Message-ID: <49a9337f-6808-4f30-b826-9a280849a51c@baylibre.com>
Date: Wed, 18 Nov 2026 12:28:19 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 11/12] arm64: dts: rockchip: add NPU (RKNN) nodes to
 rk3576
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <f9f4f43cd1c4c8c6cee0371b4b92badf37e68832.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <f9f4f43cd1c4c8c6cee0371b4b92badf37e68832.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_042824_240043_DD6F386E 
X-CRM114-Status: GOOD (  11.53  )
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

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> Each core is on its own power domain only: core 0 on PD_NPU0, core 1 on
> PD_NPU1. Measured with both cores running, the results are correct, and
> the nputop and npu domains above them are powered through the domain
> hierarchy.

No need to include lab notes; we assume you tested this work and found
it to be working before submission.

> Label PD_NPU so a board can connect the NPU supply. The IOMMUs use four
> clocks.
> 
> Also set CLK_RKNN_DSU0 to 594 MHz. Mainline sets neither its rate nor the
> NPU voltage. On the ROCK 4D the DSU runs at 786 MHz by default and the
> rail boots at 750 mV; with both cores running, each pass of the 5400-row
> test has 11 to 25 wrong words. At 594 MHz the test is all correct. In the
> vendor OPP table, the 500 MHz and 600 MHz steps both need 725 mV.

I found this wording a bit confusing. I think you're saying, the system
boots into Linux with 786MHz & 750mV, and that configuration gives bad
results.

I'm not clear why you picked 594 Hz then. What does the vendor kernel
do, are you matching that behaviour?


