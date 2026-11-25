Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44068606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dsRXgFjm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M4aZMNUL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0KRutoAXol4rkfxgv8cg1HbYxX5YuCi1F4TeDRlqdlo=; b=dsRXgFjmwkgA1E
	TXKEWa+21BfaEQyBD4oEgBU3MYkZ60aFejglQrb0Z0PxT2rRl/PnKWNcyTZNTRctvc84H9STAJRzp
	OTNL7GIALwwU+E/YfRqTBkGPCuJqrPq7stUQ2XqRQ5Bhmygjqpus/xXWW72gjGMhWktCjLiiUDnL5
	7wxIxuPZEIan8G5L2z4UirNve/x41xS5jLzc68yWcL0TYHe7mEdh3LjKUcV63UyDdCVn6+C25fA7K
	ZgitCswJnBY1xKuM5fvHsvsa/ukIQujXVLKXERz2HvrO0rLQPOpoS6HdcCDmr9FC+Wt+mmr9GByMo
	1jGCB0DX3b152ncrHrWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCK6-00000009rxh-0SXQ;
	Wed, 25 Nov 2026 12:42:06 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCK2-00000009rxJ-3QUQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 12:42:04 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-7d2eba2b74aso3322669137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 04:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610521; x=1796215321; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0KRutoAXol4rkfxgv8cg1HbYxX5YuCi1F4TeDRlqdlo=;
        b=M4aZMNUL4lEyfcpH5XDu1Sv2Q3ZLGDe7lSySWvyZvEZ7a/eJPFCH6MteTTvJnNTfXi
         mZMphKBxF4ZDZMgzaUPpWq98SZHwUc4DPGO1Og9oFYBrXz0u7y+StOkZ4LzpK5aZ+Wwm
         EZ9Ne4+cqbPOmN9Hymk0zqoPkpBXdp76HpCwDgws0Q+K/yjZZxZCpy1bPrpcMMj0kVDn
         PmtiyKBdsbcDC44dwxBZgtgXu5IwCkqDM1TNScXasqhYQGDbOSXVEXUm7TDJ3CL0qJK9
         p++WXILPtqxTzmy4XF500KaatKUcmNx5+IamxHbHQXeDqXHrIZy9l3gtGIo+Dz20h1Zh
         wrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610521; x=1796215321;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KRutoAXol4rkfxgv8cg1HbYxX5YuCi1F4TeDRlqdlo=;
        b=R2rCyaKJ94Qj7H3ga2YLXcAD47ISF+FBZkJk56NjuJXreuKWPfKHaAXejTbHp65uia
         2Bce1WdNbBbfE1D5jk8De+To53961JHhD9eMERqI0MUnSOaoSvAPgr+vlghQ0sAle9Bz
         DW3dI0ufkGHJKRoJhbobHLLPnoU6ZrcAZaa9vKOPnmUyD519eIZsaEdHHyPZQxH94JsO
         n/gDLXmxzT3018HNZgBUN0wRT4gK/w3BSRdwVOlp8CWlsUCOa4IC2leoHLasu+yYKNEL
         JEaGCnyc6wHZq9m7Ri5b/8urJQhOmAV4ExgS+3wOmq/5pwn+ab3guEefjxZ5k1l3NVyG
         QPSw==
X-Forwarded-Encrypted: i=1; AL+hErHvViIjGVJ5CEPycg4hlcCjOD9qMnxrUU6xyyvcykwOHXnslKL9ArMR6dul+oe++Lwss9G6Bfo5OWauNub+S6XR@lists.infradead.org
X-Gm-Message-State: APuU4Z9OioF872qbWoxhD5mWkyeTXdxdrVU0PtHuT5Sp+311wxCeMJWS
	NgH2eAQKdiV6KfnDzXGYkPLb4lIZeyn76en4rnn/GmO8iVnDP5XgbYQP
X-Gm-Gg: AZFdTZd/3lXZLd17vM39G7ABrfT7y/c2M1trixNKBqsoR0m0yTxtBnzZH1f4itg7m10
	tVd9qiXhS/1LCn8A91AUhoAQmer5twv4C+JRaid+XJssgIXJLQ9yWFQUbXhXtYJUBSVznr9o7/o
	t5RIN5sSGAABK1uWjR3ZjOvGo1kJcUIhqcNCyOQnygIFz8pQR0cE1nov1bsKUuV8YcCUj4OJmgy
	Pzl5tc37NyrpIxJrEDKwQr+fQe8I8vPXt+2ZD/2px87fY4uVubfcNUaTeeXnCFBKsnv4KtnEAkq
	yqEd8DRMnRXf5B4I7CgHkc0xNn+o5BBOexXUmZctNW9WkW3dIoYqjPzF5QiqraxwOPLBdurF85+
	D72pzJvYX66w0ZBGVTJ/BmDhBYi7bGbJfZfjjDCRxNrPdT+59NqoO2+lGXcLfBe3jV87xj3mhXS
	kkE5sct8Ee6oY/qUq2psn8U0hmmp6KC6ARFHdCOQ8AUCtzTD5RFv+JnInEouYKcnTYyf7O9rV+H
	O7K9LJ+jSaa9Wy3RdJtvIQINawKv/1BdhzH9YBai+buTk+upQH+EIgZlEUt8sWc7YAwBTIpzVeC
	7ZrDjvVBMt4rNJXAFghd3UvUuCsR6Rhgt4yqBa+HuLCN/pH4cjEqLC6VclOmDetEn8VGSLggxI1
	4/xTUX6apTmhn2vmibKzcf0rOjtpZe5sz5ev2nRZrf3Vr3nCE
X-Received: by 2002:a05:6102:951:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7d73939011emr10098810137.12.1795610520935;
        Wed, 25 Nov 2026 04:42:00 -0800 (PST)
Received: from localhost.localdomain ([2804:1b2:aa42:30d0:f600:3026:6717:b8b7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e033aafsm18213181241.7.2026.11.25.04.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:42:00 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Wed, 25 Nov 2026 09:41:39 -0300
Message-ID: <20261125124139.23869-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com> <20261122004008.0ee8e16d@ryzen.lan> <20261121-a733-dt-v4-1-reply@gmail.com> <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_044202_887514_4B7FB776 
X-CRM114-Status: GOOD (  12.07  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andre, Enzo,

On 11/24/26 15:42, Andre Przywara wrote:
> could you wait with a potential v6 post until I got that one tested and
> posted? Then you could ideally also include Vinicius' A7Z patch, so that
> we have all in one series, and just need to deal with the dependencies
> once.

That works for me. The A7Z DTS is ready on top of Enzo's v5, with the
review comments so far addressed. I tested it on my v1.11 board: all
eight CPUs boot, MMC0 readback matches the reference SHA-256, and
card-detect hotplug works with GPIO_PULL_UP. I also tested PMU counting
and overflow interrupts on both the A55 and A76 cores.

The A7Z binding entry is "radxa,cubie-a7z", "allwinner,sun60i-a733".
Krzysztof already acked that addition in my v1:
https://lore.kernel.org/r/20261113-tacky-unbeatable-pronghorn-74ed4e@quoll

The v1.10 board is still untested with GPIO_PULL_UP.

I'll post the updated A7Z DTS patch to the list as a follow-up to this
thread.

Thanks,
Vinicius

