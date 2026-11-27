Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB043606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U57Y/xLw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPjOG7+q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5RPYgSF1XDHYafp5XjEHe2Hos/Amzm3Q5tQ+HDP2AiE=; b=U57Y/xLwQb4U22
	cMdTLunigYeD+NfBoQ+F1yazz4cpMRjYJUAbdgCnd5sjc6kABMGTlfg1Yru2KPijpeOyXjUKHxeVd
	Il0Ci/MK7hBj33vCePzTyC6BpB/lMBVLU6GPoTeW2V8e6p+FcQnM/S4zNnKp4NsB6PgxXoUxeFQgR
	e815JCEScL9inGedOEDZcRhoSS+5dZ9u16ZOe8qzJQeueiwQrhd9d6LFPfsMfbxAYaQGMOGBBsGSH
	Uy4eJlWeGFt2eFEnOYMp2Yv/uEYhtDy8K9sf7l/l/ssYQ9+kVN0OzEy4ANS4oe1ox/G9n8wrLN1fy
	kLJZc3EuSGcvbRwy02eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyrR-0000000H5vN-2rD6;
	Fri, 27 Nov 2026 16:31:45 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyrP-0000000H5uS-2JgM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:31:44 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso2850578e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797101; x=1796401901; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5RPYgSF1XDHYafp5XjEHe2Hos/Amzm3Q5tQ+HDP2AiE=;
        b=UPjOG7+qbFXIod0F2o3MYoxQxhOOTWd1qnhJfKGiEufT1IJ47DCgaf5Q6drHDNnhL5
         +Q+rcca9En8i8OsPQkU4+O09gyFUk9r07Xqe1idpyfoAM0fGqd0a63yezwOO7xY17xIX
         Xqlvk7RN2el+14So5j6xcAmd/U1FvsNQ/GWOvdzeoRvauq6E7yHBhM47BJAyHDv91+qH
         iAMKSUdByyNlIbQu22798lC/yshzUS0yIxslRqhBrqktjsTdz1AefhHYOFw3Fe0QejP2
         20MK4fguC59gfyclAoQtSYAT/Bcjg0fET+MyXbRh9EIAtQmIZg3kJvn+KPuP0833s4dD
         RBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797101; x=1796401901;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RPYgSF1XDHYafp5XjEHe2Hos/Amzm3Q5tQ+HDP2AiE=;
        b=BsurOeRAwDc4FgXdVHW0cd77uxWpUhLCC6fzEYdMlBXuDDW1SNWsM9+0wwZyZz7nU5
         xt/HfvSKaRvx/nqJYOmXr0ofaxfceOox/niCCfp3Dni3qckOkBPqPy/OsBsqv4qXFquL
         1GprXHggpbMXoFfqKU1Tv+Jaj7L+wWfadIzWJBm9HQuzgPiI9f4LrG/YEX+tBF8D4rVK
         1vQU1pX5/Qi4Fy5S1gXKWHR1iBSwPZWhkaR1TsEuNh9nVgrNNd1aKioqmryYluiINWbd
         dv1y83OegsDWizgIvFBsHZgwHrxrv33fmEG7ug1jyyilr/vVTLXRlqm+fR4Iwi3+UcfK
         92Rg==
X-Forwarded-Encrypted: i=1; AL+hErFnOrgZ7eY3/YbLR7yMZiz6YEInaY2eN2Z9u8lDT0q/JmIbxnuBOsWuUoi3ucnDuH3bgq4oQJlGOP6n5QKPpi4v@lists.infradead.org
X-Gm-Message-State: APuU4Z9EevHP04F2YLBppslLdaoQ0kLHXKdQ5nt1nbRJzsDnNKaZyGh8
	nAaIR58l4efd3+ToA5OFNRaDznMkrE1b2dmnzNAESyRk1KjavuFmNh+H
X-Gm-Gg: AZFdTZeDc7jbQNqHyYoTZM+xQDPorku/yA1J+KPZ6Dx8oaRECZSgRBrLdKqBE7uR52l
	yE6EGmLs6rmna/otjEl1sFp9ydAhP3UBtII99IalBXpE0ArfqptugBvDUIPGBlQhl1O7UruJxnw
	ltYTjSk+fUBzYw3TB4T0F/mbCjXPhybSwCik/W21JqMlIsvQAOVWXNsONQsXnnMX1PmexOAX1Lo
	uZ7MD59WBSgaBmLLxalrqCtHFQ8H91pfo9ITEl1EVCHBX4K0q00ffZGWx4C2xYiPJqV1hY3Gi8c
	/hVJ0swmD/PxevvJIj3RSR1eFZbigjUFbf5kc7pAUo/JNVTCATqYkMrpthraoxpUZ4OuldD9xMU
	Shxs//Op6a5p7w9WrzAbueuBdnRtO0JK9jZR56h4lDVVHajiB7ND2BGClBFrxaXHEIaOsa2w3HR
	Zy5rSR0NpLYU9eFreJahUWN7Srag+r5HWhXm0EzCFbMWsroLPnThwbeeYaTusbHJGK9ozuL2iqO
	N2Ch/nWIcrBQKPjOgXTFEuX3FP//CMTDtqkpiRoCUy3iPGrw/A6TelsIdZaJVFJsW6oyFyzYHuE
	VJ/avVxdl07IR3LzaiXNIhhlfWee6Pgd2oLUox2aL56dSXE=
X-Received: by 2002:a05:6122:3b8c:b0:5ea:f220:fd6e with SMTP id 71dfb90a1353d-5ee8aeefceamr14730581e0c.11.1795797101340;
        Fri, 27 Nov 2026 08:31:41 -0800 (PST)
Received: from ehlo.thunderbird.net ([2804:388:90c1:771c:18eb:ef7b:e7f8:aab3])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99eab8e7b9esm10043528241.3.2026.11.27.08.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 08:31:40 -0800 (PST)
Date: Fri, 27 Nov 2026 13:31:35 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: linux-perf-users@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Sizhe Liu <liusizhe5@huawei.com>
CC: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 corbet@lwn.net, skhan@linuxfoundation.org, bhelgaas@google.com,
 yangyccccc@gmail.com, jic23@kernel.org, john.g.garry@oracle.com,
 will@kernel.org, james.clark@linaro.org, mike.leach@arm.com,
 leo.yan@linux.dev, peterz@infradead.org, mingo@redhat.com,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, wangyushan12@huawei.com, wuzongyu1@huawei.com,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linuxarm@huawei.com, prime.zeng@hisilicon.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_0/8=5D_Enhance_TLP_packet_deco?=
 =?US-ASCII?Q?der_with_field-level_parsing_and_versioning?=
User-Agent: Thunderbird for Android
In-Reply-To: <b1733f2a-ed03-4f38-8c40-6e0e535f1632@arm.com>
References: <20260908140509.2485649-1-liusizhe5@huawei.com> <aqB37YCMUYKodo3N@x2> <b1733f2a-ed03-4f38-8c40-6e0e535f1632@arm.com>
Message-ID: <D6C7F85D-0A2C-4569-98FD-ADB616FA106E@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_083143_597887_59084F7E 
X-CRM114-Status: GOOD (  10.65  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On November 27, 2026 12:12:14 PM GMT-03:00, Suzuki K Poulose <suzuki=2Epou=
lose@arm=2Ecom> wrote:
>Hi Arnaldo,
>
>On 08/09/2026 22:02, Arnaldo Carvalho de Melo wrote:
>> On Tue, Sep 08, 2026 at 10:05:01PM +0800, Sizhe Liu wrote:
>>> The original hisi-ptt-decoder only prints raw hex values with generic =
field
>>> names for DW0/DW1/DW2/DW3, without classifying TLP types or decoding
>>> DW0/DW1/DW2/DW3 fields according to the hardware-defined packet format=
=2E
>>>=20
>>> This series enhances the HiSilicon PTT (PCIe Trace and Tuning) packet
>>> decoder in perf tool to provide detailed field-level parsing of TLP he=
aders
>>> based on message type, and adds a versioning mechanism for backward
>>> compatibility both in hisi_ptt driver and perf tool=2E
>>=20
>> Series is sashiko clean by now, has a Reviewed-by, but it touches both
>> kernel and tools, I wouldn't have a problem if it was processed by
>> whoever maintains the kernel part=2E
>>=20
>> - Arnaldo
>
>Please could you add your Ack on the series, so that I can pick it via
>Coresight tree=2E

Acked-by: Arnaldo Carvalho de Melo <acme@redhat=2Ecom>

But you could have taken my "I don't have a problem if this gets processed=
" by somebody else as an Acked-by me, documentation says so=2E

- Arnaldo 

