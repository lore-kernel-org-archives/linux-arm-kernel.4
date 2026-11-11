Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3E4606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O5uJ6/dV;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fNZl4mDN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ib+B96G7+gmq0/izhy8Z5ZthzY6w8s611Ial48mm0F8=; b=O5uJ6/dV4mylmV
	RVRZi2EHzIJntlQ3XafaYf5OJvaLBMsiDkgy7feYbTENcLOiqR9DN08pufFMigASZKDtIx4wZxLPe
	Nk0YMUr1jGXSRsQ66a2GW+ahD7/ExHKVy5Lav31RUQWLhT8XruNVXk/R4FmJ9FsVEEBu32LaGF2If
	Xsh3UtPEf+OnIhQZZusqRNb2vOP9b/6FD9eN/rBDyv87hOl3HC9IcK27EP3F7YK2ryYFot1Tc01b+
	fRBE//0K4u+yj/z39Q9wV3SbhVi5jxkWmWfY13I8KTq/YPMZ37YPqqUU5uwK9XUIlcc4jJcqsXUO8
	jy9m7Nc4teRNCKm4qqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8uw-00000006uIz-2iuX;
	Wed, 11 Nov 2026 14:03:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8uu-00000006uIR-37To
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:03:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so36038515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 06:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794405791; x=1795010591; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ib+B96G7+gmq0/izhy8Z5ZthzY6w8s611Ial48mm0F8=;
        b=fNZl4mDNndaEb2lXfN0inU6Tra7/Exf6sn0ZNsf1jbu4eAoyleIU24u9WH2IPbEsl0
         aUiMK+mm8z5eIi0rM8LB9WrCer01kKPw+cMfHePkudtSDi6BIDuEU+A5prNg4PIH1ppd
         KjdfLT0MUzDvpPno7K68QAm+0MM+b2za9PPENHAuDqRH4yTd5DTM267KYYm6rURFQ90p
         nIfX0dRvdZlWEM9ep8gX7vv8ibBF5ElIY7ZPase6rdkOW+TmVJOWwhhNP7XaR70pO2NB
         FGHRPgmqvuLwKEeGaItEO2g4Yo5syEO+1e0HWUrOWxHJZdRSA+cG1zYlErJSbCxzyPk3
         xhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405791; x=1795010591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ib+B96G7+gmq0/izhy8Z5ZthzY6w8s611Ial48mm0F8=;
        b=YN6MS6TVmZNR1fDnlDyWPXOktzhFa1m0+tihLzXfDe/H63x+KYN8HrUZmQHAEHz9UX
         L3zN3iMM2qAOGKXUPkY6id7MDzvVkeu0m6iwXYntUSwoRv19YO/GgiCZZbaVTeQdXVpr
         rYHLYl8AFb4rUAsgOJn2EEaYW+C1qZ0weaP+h44xqt7EjNlBvlIPRb7eSRNv73yVnk+F
         HQWY5B+9NtVJQwgDb25ITkwdR9pEO+tyQihp11WbjKaZWC7sRuX/X2v7ZnM4fMHSjVMM
         Br/nAQKwAXMWHYmZGKQqxe0Y2tiuz4sioZnGs2WMCHj9eICCqGuwNBTFco+GEfqZiwvJ
         DWnQ==
X-Forwarded-Encrypted: i=1; AL+hErET0OBulaz7e7CWDDBRhDXvXqYvyZT0Ou34s2q4NX688vdw4Q6KotfAiWxX2Mdx9UsPyRJbIKRGggRdl87LRy8+@lists.infradead.org
X-Gm-Message-State: APuU4Z8FQ0IatzJQdk+6944hcgku9dTHmxYAeVNRUZZ2uQVZ0TUOSPcZ
	tYZ+fyU3PRRHKwkVBuoz6Qxny7shcDO74+v0jW3QaOR/DgZ/MPvkiSHRnRYgBnlOg0A=
X-Gm-Gg: AYBFou3i0WYFkbQePIiZM/gEzAMeLaBapqg3T/2KZOfINEUQAxJi99lFQb/Z/hMHMHA
	evLr3H9+R+inhGwOpAhCWEFpX6YqqIL2yD3BxO45lRaGrsKFjN+M4ISOZqPhG1jce92jv9e0Ahx
	cXCVp2rDE6iVkaOXeJMfdkrfx++ZadjhI8QwHxTSYrp49h1QSTgH0f7IlDxDQXBFpM6rGnlJSxK
	9+LH3tMI5hOuA8Z1qJ5lJ6NEylUqbjhn+Okani/C/8V276oW7IiJNRlHDBcYBIGxuf695Uf8AQ6
	Mxf6S1Zf7b2NgtgD1pcDANmM02kH94mMEAQ4gQcSTzRaBqYuD6+sc/Z+DWTdhkCbwKxlxHqt+RG
	5HqaehzzXgk8kCrgTH9jm3I8oUXNy/j1WDaguGN4CV+/7axKeHGzC5Tnc75GyQeba+tw/m6cwwQ
	jYBk7NvhmMqciCp78RLN2J0VM66ng88mRCWIW5QvvN95uiFC5bQilxnEW21gLFH4RQG+LknsJbC
	Y+cqqsXqDiG2aS+XRYVQn27jHt1Itg6J8g7ud+yNEMDd8JzxtyfjYj1/obWps1xFxwrtK5ROT+Z
	rvGb/pUvAaK2Z9AdjgDevA32Dr2dzHzEySsatGHm9hc+G4DNcFRyfYw=
X-Received: by 2002:a05:600c:1549:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4ba0938ba0amr45260745e9.23.1794405790819;
        Wed, 11 Nov 2026 06:03:10 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba476sm172702635e9.2.2026.11.11.06.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 06:03:10 -0800 (PST)
Message-ID: <1e5907fc-40c6-4025-8d27-a92b3cb2845a@linaro.org>
Date: Wed, 11 Nov 2026 14:03:09 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix misspelled
 PublicDescription keys
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: linux-perf-users@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 John Garry <john.garry@linux.dev>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261108183846.3804875-1-takano32@gmail.com>
 <bf6925f6-613f-4e20-8491-2a99183f34fb@linaro.org>
 <39ac224f-2903-496e-9a08-b4c5a33dc87f@linaro.org>
 <179440414898.2353714.11591904089911934138@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <179440414898.2353714.11591904089911934138@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_060312_812225_15B75659 
X-CRM114-Status: GOOD (  25.46  )
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



On 11/11/2026 13:35, TAKANO Mitsuhiro wrote:
> On 2026-11-11 10:16, James Clark wrote:
> 
>> IMO I would rather have something that's incredibly strict and simple,
>> or nothing at all. Having to work around edge cases and report near
>> misses doesn't sound great.
> 
> Agreed, and the near-miss report is gone.  The series is posted again:
> 
> https://lore.kernel.org/linux-perf-users/20261111132622.2349165-1-takano32@gmail.com/
> 
> The check is now a fixed list of the 51 keys a json object under arch/ may
> carry: 47 of them jevents.py reads, one more metric.py reads, and three are
> read by nothing although the tables hold them (Counter, CountersNumFixed,
> CountersNumGeneric).  A key outside that list is reported with the object
> that carries it.  There is no cut-off, no similarity and nothing that
> depends on what a run of the generator happened to read, so there is no
> edge case left to work around.
> 

The linked patches seem like a bigger change than what I'd expect. I'm 
not sure that's necessary for something conceptually as simple as 
"validate the json files".

I'm also a bit lost about the relationship between "[PATCH 0/3] perf 
jevents: Report the JSON keys that jevents.py never reads" and "[PATCH] 
perf jevents: Check the JSON keys that jevents.py never reads".


> It still runs as "make check-jevents" and as a perf test rather than as part
> of the build, and on the tree today it reports exactly the two misspellings
> we have, the 16 in this file and 3 in the AMD tables, so it wants those
> fixes in front of it or together with it.
> 
> The one thing I did not do is put the list in a json schema file, because
> perf's build would then require jsonschema, which it does not use today and
> which is not in every builder's python.  The list holds the same names that

It could run if it exists and skip if not. Or we could make it a 
requirement, but that would require some agreement. The docs builder 
already has a pip requirements.txt file.

Even without jsonschema I can't see why a validator can't be written in 
less than 10 lines.

> a schema with "additionalProperties": false would say.  If you would rather
> have the schema file and take the dependency, it is a small change from
> here.
> 


