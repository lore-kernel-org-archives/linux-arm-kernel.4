Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A52606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZqFMc+I9;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fSxSx+L2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vnwt3Hg75Jqhq/RX3EnfxRob7Sm62Nv/9HL8t2YUaCw=; b=ZqFMc+I9CcDWiF
	YKBCBU1XTSHQK/FmdbjX3GQ4fmQu8m4lIqICbQYk2b1TlIW5d5mCYY2v6z+2mKUgcDUFuDpOVAiMZ
	xtUvF9SXWd7BBx9Ejqjv7iR7GE7xXBwawDGcjUb2aNoOpaxEwNO6RnvG8spMgawyDWz0Uu7m1u9CT
	tNKe49bxwxFCSn73ABaG01oWtfS+oipFN3Tpino2JxHPdVZRjkfN52XgZyt5xGWZxfVaw7D/89Eb5
	t92lWJqoDxDyJuCgTK2W3q3dHjSZvOz0Wd23lbdjmIgBmBhRcjf7gfUWkHG+hxzNazQd8pMycB4cX
	q+AYjr1j6Ktf5Fhga1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVp7r-00000006RGY-3r4i;
	Tue, 24 Nov 2026 11:55:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVp7k-00000006RDH-2dLL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:55:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so4196394f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 03:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795521346; x=1796126146; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnwt3Hg75Jqhq/RX3EnfxRob7Sm62Nv/9HL8t2YUaCw=;
        b=fSxSx+L2wMbO3E5gkpTlZAhROlihqaMemJR2MBGP/xKl/F25PHdcjAbeBx1i75nwVc
         NIfL6jyb1pc6Fy18IIkcgO9KSCS96PP+/inmmGkfTJM0FVkmUzcO15+/V9b92PjkIPl8
         0BjoqB2WEqjEvngimq46wCOOhNSA3Su+Ct41iKtFfO4G5fj4eRB/F+t22gFQGFAXCwln
         akdBxVFz62j/VVMh60gpB0+4n7NXrzguP1S4RlmAPilEcZMOC4K8rJdsvAde05UQqDRK
         sioJKmovMhYcgXHNc/Ho6qdcQkg240XbNT4PhC/WBtaB5un/Ew7j2joTfR3Y4IN0pcwk
         aE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521346; x=1796126146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnwt3Hg75Jqhq/RX3EnfxRob7Sm62Nv/9HL8t2YUaCw=;
        b=CRhRWP2dGld/C9krY0yXLK9P5CY4m6HL+3F78f/q/uYzMMTO/6PiOl/pBJt4x/+HX4
         tcsMxkAzKgcoh5tz83ROn/VVBU6t1aZLjUSZZmdPVE4ukoHGOe0Vwmg9HS9Jm6e1ASAU
         fQS/kbjjoGdkE74KNcagZaKE3hvcmEcn2QVUWjZdLUyre7vlVz2Vp6JzRnHgDLkJSOe4
         gu+0aTehETHMCgoVdri3ZZJmKvdBZX6pon4RZ9fcKJuPINaxcRKQOzDROCuSPe4HmhGR
         W9N7o6CUUZ2NPVwNb0klQitrdqZ3bpqBug9lYU2327TosRBUvwZgI4Zij87nR6InGVA5
         qlUA==
X-Forwarded-Encrypted: i=1; AL+hErG2kz9b5jHkl2e/S56K83631aErfJYVxahmkE4twKaCu3jsRwmdknoofoFeLmE+NnUhJy/NWZIwSUBWQzYaxc+2@lists.infradead.org
X-Gm-Message-State: APuU4Z+E0PtWxelLtNRMhECVUJbjQHVZ/1SyPOsi6w3K14VUWA2iK/dL
	Q2O38cTqgFSNppJLpOrK49G5DoLjo2nl0/tEFuBns9H+k8cDqj7HPkKNoe7uJTOTR1I=
X-Gm-Gg: AZFdTZfIlKjvNFZ1GhP7+Dl0kq+Q4d5wjSs/934WJncGj8KlofrymxGzFBUch/agaf9
	p1W781lJWxxwGTcSMGEvGpy5UDOnWyHLAFTGcz2FYAd5QZY3itp7+sJRMraSj/7RrRIa4acymlV
	3xEryXlMUESJtTSS/0kC7Fqy0ejYqoM34hjA6ra0l2OA3x+3Lz3UDNeaHgspB90s9QNlVfOFhf7
	4WFudM+zXZLwnO+QNPIYvuFFyjBlMHROYrqRWSQmGDEQGBwpYa6lCHHnrUguq+joR13zt6h83jr
	d53nXoT/kC0RVl//CdUv19p/rV9CeagcOTjAsDm80QS8XlFF+Q9bcnDhyeTEP9rHr1KqPbBRGHu
	Ll0G9Q0aRR/wewjUb8BxdjCnmBW0wRZHXrSfttB0D929p9Pel0VIvAetXV77EYeyDqMu9mBK6Wj
	VDtjl/hPrVfwITBNzKDLNuFCuTUTkbimICAslfCvKtWvxF08KuH0ejQRqKtyBovZ2Nvq4+R1m5+
	dyHb6Nyj7QUI8QUHMVEmsM+g1GqviL20IkxLHrPSoiDG7xsdGwYelXa4p4B4IheFk6B48y8XhP0
	ZfbrKX0bvnxgJcWmTu6ldEjl2ZeglqTjyVnqMvEih16fgUbiZw5431ZBglv/lAZj7SBiMxPy5dV
	hvJcdfpPNA/b0gpLs2m4z4kY=
X-Received: by 2002:a05:6000:428a:b0:4a9:dcdb:2e11 with SMTP id ffacd0b85a97d-4abb8406ea4mr29382891f8f.41.1795521346404;
        Tue, 24 Nov 2026 03:55:46 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm26566053f8f.40.2026.11.24.03.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:55:45 -0800 (PST)
Message-ID: <bc4234bb-8901-4d0f-bbf9-66f9715c11a9@baylibre.com>
Date: Tue, 24 Nov 2026 11:55:43 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 8/8] arm64: dts: rockchip: enable the NPU on
 rk3576-rock-4d
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <0bcd73278a4c7a0cb2e1b8bdb9aba306355384cb.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <0bcd73278a4c7a0cb2e1b8bdb9aba306355384cb.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_035548_692531_E3617AF7 
X-CRM114-Status: UNSURE (   9.21  )
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

On 24/11/2026 00:01, Jiaxing Hu wrote:
> The rail is switched with the domain by commit
> b1bff9ced657 ("pmdomain: rockchip: manage the RK3576 NPU domain supply")
> in the pmdomain tree; without it nothing holds the rail and it is turned
> off as unused.

You can omit this part of the commit message. The dependency is stated
in the cover letter, and domain-supply is standard enough that it
doesn't need specific documentation.
> npu-supply is set because the binding requires it; no driver uses it.

So why does the binding even exist? Is it because it will be needed for
implementing voltage scaling in future?


