Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BC2606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zKE4ddt7;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CckJPAAS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YUvt7IIoKlvtxAuCyE/azMUHT33NEIjDoKG3KGZFhmU=; b=zKE4ddt7pN4Vvg
	IxHSdH/5rBni/JG/3eN+5NMNr0VBCVd7pRpWSsXXRJEj9lizS95e9o1dudrBc7gpNwado45LqAaDr
	JGu+v+bHWgzddAM17HmiPHbbJ2gwz1kOqXL5RIyxpeiL1d3ZLCZb49Ag+/pGUYg5TXShdxJsOxcWv
	Xe/dnRppYi0vvVDAnK02RQvJ4yKG9yekTT6CdRQ9RRqVeOWt86Rm9J8w4Vl8A2RxaxZyzQ1XHDGeD
	lXSBBfT8Yr8aG2qVQsV0ilWJmEjmb7fA0cyfAP8e4NhtnRkjueM+YAmKYX0C8TS9+Dl04atXgbT4a
	Eocxe66pkNhspxe9ARug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtyi-0000000FloM-453N;
	Fri, 27 Nov 2026 11:18:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtyg-0000000Fln9-3K3B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:18:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so49411185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 03:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795778333; x=1796383133; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUvt7IIoKlvtxAuCyE/azMUHT33NEIjDoKG3KGZFhmU=;
        b=CckJPAASbbQa4zu6mbNlYhCicQ8nyqz/BOOG9mu+p5P0iDQWwDabDnIs36YnnJER6L
         AKqoeZ08VJbprnROcLHeHW5C/uF4J1SMDofpAAR7WKb5U53d3CTcLJOHxL7rkUWt1i0O
         M3JZxAj6/N3cQliYCy0o+EBDkf5XhO5ze/bRjKaVe7/28Y6ccltKyBLNuAmCb2RZ6vP8
         AYfTQaeXEUEUn/T4tVvbhlsubvo4zU5wi+RXAt/W7zXy6ZrUjO2HzGkxKKeTBLCyTrlb
         ukAxBhbZLO48Niovw5TlyQ7676ZiUi5ekYZtyjwy0caeZynKq02q06DbPaEZmP6pP9sG
         0ZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778333; x=1796383133;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUvt7IIoKlvtxAuCyE/azMUHT33NEIjDoKG3KGZFhmU=;
        b=P/5m1uWxTCMpTrAZbMYnHvKYM06OIqP+PxZiy4rHKexOOfLF5K7kbO+T9yqvYG6qKQ
         lBX1S655j8a7Uz6BEZbvSggqtZsyk1JYstycqDxh6NegFrpPuNgQCCOHisbKaDCvVjOn
         48scFjfty5HDt9RXGPHhPcFLu/Y10d+jlAZBcRSzGqnCyEO4NdZD+0CZQRekGNe0kEas
         QwtvHGly8pztgLFdY+gJdjYR7IdiRBwjnQjQhwPo2s+C3hwMSmTOo5wLBZEwo0phl8lx
         HtMLVKRl/SwDKLozlUweN+fqhHQ2Ge1jzy3zUyHvQ41wcdzIe27rXsrO1A0qZkEXg9HU
         GSjA==
X-Forwarded-Encrypted: i=1; AL+hErFkK5laCH50dR0OIn9HRj8DE/i0QzyV1QisYNCBW+kCKGOYl0yWC4m7UfCGAELe3QEAnulhpWQkS+gCEM8AZ4jW@lists.infradead.org
X-Gm-Message-State: APuU4Z8DCZTSbYNhqhQqvSkndtkclnIdP2OwwMdKO5d2jkjLM3I2wN0Z
	5wUn7xSFrxCaedeUtWDgG8tQ8f7qm/5XKZAi3VFTjLwTHZpHg12G01vAmZbImdidHgg=
X-Gm-Gg: AZFdTZf1pskpRmQ/kcnEsA0NG/YE+goPY0yTwaSxO8E3AtJIo5n870d05/9l2zQVRQc
	/X2zUElgns2T2lTRi+CsBzQjCDZNucSTV4PLmeen6x7HaVdWmnuwQh3fllZdWLYbV5Mwf9QvNFs
	XGGCW5Vx3O5rjfGZ02aPYJ3874MwdYW1Xv1vNjWPSonTpyqp+IKN1mdTjr2T9QPVyA0cRGeQYB/
	00r5hLhe1msr3IyM2DIC4TIyN4MGCxdHk1mudtc3EPhZ6qMJuEHePh2JLzcKAadb3LnIYCdjV3k
	IuGorxPmK5OmOE2T9KCD3DYAtql9DR2vOeyLDaeJrgvKr9gLrxHYqSFZab5WhPDD0HM2+RZC7My
	8q9GELylyGq3KERcZgeGuN13PEBE4Y5LmY9YqPxMdt9YGyGXXZ8K/07tzJFdcWEKnbxGQT+TZzz
	6ydfXLdmmuwY1lHwMA2Zas7No4Ger/olBgeibcHnMpiLqq2ayrsUeJouGix8UdUYQRZ0s4lqmMg
	DFDDJs186Gm9HHngF60cLqhQid2lhsuczPvjGnjI1SmYhAhAWILrD1ytsx4FiN2044IEj+W1e51
	AJczlcXWAf5v+/aTrCMyZdLcpa6caVwvK6y/z5TlwBH0zxOxZpzf8mw=
X-Received: by 2002:a05:600c:4313:b0:4bb:643e:3b8a with SMTP id 5b1f17b1804b1-4bb86162fc5mr365706495e9.17.1795778332871;
        Fri, 27 Nov 2026 03:18:52 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm38560547f8f.45.2026.11.27.03.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:18:52 -0800 (PST)
Message-ID: <b83bfb3d-d654-4b99-8ed5-ddbbf90fa6e1@linaro.org>
Date: Fri, 27 Nov 2026 11:18:50 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] coresight: tnoc: Fix fwnode reference leak on
 probe failure
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20261126-coresight-v2-9e483a5f35a7@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261126-coresight-v2-9e483a5f35a7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_031854_856196_4E418815 
X-CRM114-Status: GOOD (  10.64  )
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



On 26/11/2026 15:57, Yige Jiang wrote:
> _tnoc_probe() parses the output connections before allocating driver
> data, enabling clocks, mapping registers and setting up the trace ID.
> If any of these steps fails, probe returns before coresight_register()
> can take ownership of the destination fwnode references.
> 
> Get the platform data after trace ID setup. On either lookup or
> registration failure, return the ID if the AMBA device acquired one.
> The platform-device variant does not allocate a trace ID.
> 
> Codex helped trace the two probe paths and draft their shared cleanup.
> 
> Fixes: e54a52a28a36 ("coresight: add coresight Trace Network On Chip driver")
> Suggested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
> v2: Add the TNOC fix identified during review of the TPDM patch.
> 

The threading is broken for the patchset. Check out the b4 tools, they 
handle patch creation and sending properly.


