Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3772606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yQ1ZO1gl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RiyONzss
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ahaMej8DG5x+niwqDwGDjqEkplFHIH2ZYDylFYU9oY0=; b=yQ1ZO1glP7PomstmBnmIfNlYCC
	O6eodic0xA7Fp/aHykQW3Lghqzok6gNPLVAVN0N8N4raXOEkXfkSvnpnvpqmzKhFicJMnShkKxXRd
	HU3FHLory+vV1WaJ8DleGQNqJ0wDdUMAtI4SKvsTkIj5URTI2KylyAJjAJyL/hQkiiGlOZWXZlnWf
	V/H92qqg9990S4EyDjmGIwn6zYSE5/pjVn7P1eByHC0RhX9YcfWkThRiCoyYgZTK3Dr2GhpYfphpy
	0YQyXH9tACmFydBKwo1kNkLp+5ykaQ1JAsHW8XnI69cUfc2JMCr127MXQkFDz052AKDL35XTDf3+a
	z9wUNE1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVct3-000000057Ex-1uRe;
	Mon, 23 Nov 2026 22:51:49 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcsw-000000057Dl-0zYm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 22:51:47 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso39569221fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 14:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474299; x=1796079099; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahaMej8DG5x+niwqDwGDjqEkplFHIH2ZYDylFYU9oY0=;
        b=RiyONzssueP6wsmK4D2TcpF7l9bVtsalyVnG0CximHucp/V9kJ5tY2G2SfGp6/TEVa
         LmtDH0loJaRMlxOucn47lFsxVx/8R6ikCk9u3S5IBiGH24FM64u44l4wjYH0p7SkBo8P
         eV72aTHWjl3WVvDGNWuLZsZF7NeTKyEzkdW83YQUy2/bGVN8r6N0Lj/jEjF4OqRTia/N
         5MwMP3xmhmcOyJsgVzVByFjYgvN6xQneBfxsMaPtzk3Y32iEQb24s4pkwtTrPawIlpFP
         w2zxpEJPUIrVwChAf0mJ7cuucNp6Tjhk2/gcqjBy7QMnjbr6M2Sl995zVPMfr0LIfcxa
         KkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474299; x=1796079099;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahaMej8DG5x+niwqDwGDjqEkplFHIH2ZYDylFYU9oY0=;
        b=hmAqrn0PN2vPPnKBvzSLBzpDIkfzk+t7xu4R3GdBGWw8r7dF8dYWE2eylkmBcv5HpE
         mMbwumc1pE5W5L5kMT+O0VgAhdN2QjyIsOnvdQqU76oDkVFXR3qjpSbKKZB4cck7rOyu
         E+x88rA+z9qzFhfFi7B1APT7WThSCFQZd2hNpZiYNvZo1aTMQzb5VuU0lvQq1amI8ngH
         xlyK/wJTL7PZeU9v7JPnjvdicsE3kUX4y1k38347CfFoZMfCMiyX8nmdXwL5RKznESGQ
         15nNan/XCqPaWpC1s1db1iurDPQpmx00u5oG8NUbXiqcqZ8tMzmWx+5KfWRNOe6vJFGA
         /uRA==
X-Forwarded-Encrypted: i=1; AL+hErGH0Qmqv0RnfXvb/fWSceTEBrGX1WhHxnaDKKCB2E3/W8PgcVq39ZytwX3l0DwSK87ePmiA4RzNQ+vh04O3MhhB@lists.infradead.org
X-Gm-Message-State: APuU4Z9LdVt0lEzRPu2f/W5xn6mbD1NvvdHtdzwGpDLJ5+3ByLqy9lIP
	WTlV6qkLCKl8CA0NaCJ+vZWAyUmQ8eMwMkdFolAL3Fv6Ecr5zLkCkn3u
X-Gm-Gg: AZFdTZeRdUawjLFStlrDRPGAaLF4+L29REm4k5xDg7M+UPobkC/p7vPprA/XygKIYn0
	uDOMzig/PC7VIwWkjTvMxuWP40sGqq0M2kmgnzTIGCZzAia5CQgYjpIRfGgKh2wbsRumRl765Ej
	O++WcrTBDAMs/uXMR706EAoPE/MMHTMzstYLROOwvDJkyBsWTx4yN9MDyDhSkEeCMdDe0RtrBvA
	YSqH1Wi+YPrBBQ7hTPJXeQ+xZ5AiJw9p1ptwSQfbUJE6kPPgQcridP6+pxIACqS/WvhRg6TRG2b
	Qc0JTDMHdKdjc2fsFh8BSC0X+ETJyENfp0lxhyXLM56tHLk1evpWsD9W6O55VQB2icIEPC1tekW
	MVXSQvnxymujVpEMTup3B4sgEF7gce8KyAQyoMU9XSkv6bMi4e8HlAB9iT3l03RRskdh7Fm10qP
	qkIKq1CeOcpr9qz7Hi4EXEUm7wPD71NCI4fDYA3+BSiHq+eZyuwkhFjNUKPBnOmiaoXG4FwHN3s
	CIQ0gb734ce3cvoIH2Z7e66CpeR71zL21BB+/ROXCXE5kDeA/WXvaLt5HpjmLlZAD3wTMCGYsTR
	ydcd8aqjhuIGGeTZMvDuk3jp3Xis3BQOngcijTpZAcvm90cHEY6VroE=
X-Received: by 2002:a05:651c:a149:b0:3ac:e4fe:49c with SMTP id 38308e7fff4ca-3ae7fa65ademr37338301fa.21.1795474298759;
        Mon, 23 Nov 2026 14:51:38 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm36143811fa.20.2026.11.23.14.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:51:38 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rtc: Add Cortina Systems CS7542 RTC driver
Date: Tue, 24 Nov 2026 01:51:35 +0300
Message-ID: <179547429575.493865.18130205107556064582@gmail.com>
In-Reply-To: <20261123220804bcab0f99@mail.local>
References: <20261123-b4-cs7542-rtc-v2-0-31ab43f2cc8e@gmail.com>
 <20261123-b4-cs7542-rtc-v2-2-31ab43f2cc8e@gmail.com>
 <202611232056209fabb078@mail.local>
 <179547125963.75567.6386430167092445665@gmail.com>
 <20261123220804bcab0f99@mail.local>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_145142_300767_97B6AF5F 
X-CRM114-Status: UNSURE (   9.15  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

You are right: I used the core's calendar-validation boundary for the
minimum, but range_min should describe the physical hardware calendar
and its offset handling.

I checked the lower range on Almond+ with a separate Linux 7.4-rc4 RAM
fixture calling the driver's set_time/read_time callbacks under ops_lock.
The normal RTC core rejects pre-1970 dates, so the bypass was confined to
that test module. These six cases passed:

- 0000-01-01, 00:00:00 to 00:00:01, with raw BCDYEAR=3D0
- 0000-02-28 to February 29
- 0099-12-31 to 0100-01-01
- 0100-02-28 to March 1
- 0400-02-28 to February 29
- 1969-12-31 to 1970-01-01

The direct callbacks succeeded for the low years while the unchanged
core validator returned EINVAL; the 1970 transition became core-valid.
The module recorded 219 checks with no failures and restored current UTC.
The RAM supervisor independently restored UTC before watchdog return,
and fresh host UTC was verified again in installed OpenWrt. No firmware
was flashed.

V4 uses RTC_TIMESTAMP_BEGIN_0000 through RTC_TIMESTAMP_END_9999. Its
Kconfig help explicitly describes the hardware's four-digit calendar;
ordinary core calendar validation is unchanged. The source tests cover
all 10000 BCD-year round trips, and the ARM built-in/module builds passed.
The hardware evidence consists of the boundary cases above plus the
previous upper-century/9999 tests, not a hardware sweep of every year.

V4 is posted here:
https://lore.kernel.org/all/20261124-b4-cs7542-rtc-v4-0-bceefd844074@gmail.co=
m/

Thanks,
Fil

