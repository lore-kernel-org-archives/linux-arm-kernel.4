Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35574606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0M64Z78r;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FYEr2mW0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hE6L91J5Szg1VQETyjqGGoVl/6tf53hcFvWX/NKBz1E=; b=0M64Z78r2W5WaNbbkdUqSlfZ0g
	nBWoZ7f2Taq+IvpV0tLeltjA+E26KCouVIfl+VgzDCS/muSq50p5GZHImQm7HHugUq2Dxnf1Edarj
	7X4huYy87C0g2e8mbFJJo8KY5FvVMYus7oexOZoS3JTQ0OwBWwv+5YcG+91/1bFaEw7LYrc3EJk86
	qi/g6h5eSRDqQ3ry8wLQzCY6FspFBDOUjPf8izwZkKUZOzwD2qPXjNYii2HN8l0WFKwKoONnA+Ixm
	CF5cWRe40M37TohA//7fH0Xk4WGp/8cahAw6DHJjeyecepruZx3OTkLNgAhs1mJB1EJ/DE2GXk4SG
	Q7PesxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVU91-00000003aBm-3hPy;
	Mon, 23 Nov 2026 13:31:43 +0000
Received: from out-9.mta0.migadu.com ([2001:41d0:1004:224b::9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVU8y-00000003aA9-3khT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:31:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hE6L91J5Szg1VQETyjqGGoVl/6tf53hcFvWX/NKBz1E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795440698; v=1; x=1796045498;
 b=FYEr2mW0PPokR4CVyqFspOLmMZFb1yT2dnoxrjaMX3jv5cZFUVDnbYs5DXKh9DTFH6M1XLU6
 +U3ACUp4yFFKF09i5C6zbb+DzqZhnUaDYSsH/4SQn3SFVeDjL4uZKe6HUAUAUVhB8mjrc1FzXUj
 yH9iO2XSalADzu+G9yLdYtaM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id beadf72b766a9422;
	Mon, 23 Nov 2026 13:31:38 +0000
X-Mizu-Trace-ID: beadf72b766a9422
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so11134e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:31:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGmCtLGod++OJGr6ZJ52uyQJVTUd/uSOKCQWKd/5/ZZwWOBFIHVavdVXSD4XRm9jl5uh68Fxe0WgiC9YL64Q58K@lists.infradead.org
X-Gm-Message-State: APuU4Z+RLLWbEdmGIiUtBZtt4RCxQqgm9fQYCzxRiL34FADr4kbp3D7/
	UIg2nqUX25h+VUu6V5cqCezS9VnwU1DOnrrs05VxCwL2zSbT4xGTBkdliGyzfs60hFUa5aKe0/O
	bcXkF26yNY/eSwORGLshLL9fDhFgnk4ymekQvWh+Z
X-Received: by 2002:a05:6512:2249:b0:5c1:ac5e:ee43 with SMTP id
 2adb3069b0e04-5c212394558mr168130e87.3.1795440696369; Mon, 23 Nov 2026
 05:31:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-3-fuad.tabba@linux.dev> <a8d84ea8-c095-e444-dea2-23b92866f970@huawei.com>
In-Reply-To: <a8d84ea8-c095-e444-dea2-23b92866f970@huawei.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 13:31:00 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzgHrodq07u0omn=A+XL9TqbJXTE3QSosz8gicNjFxkuw@mail.gmail.com>
X-Gm-Features: Aa3M54qhI4OsITxL3yzRVRr9_MTGOX2UfSXre8ktj4oZaW-PPX9DfohxKOkt_8I
Message-ID: <CA+EHjTzgHrodq07u0omn=A+XL9TqbJXTE3QSosz8gicNjFxkuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] irqchip/gic-v3-its: Clean the GICv4.1 vPE table to PoC
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_053141_173436_64170C22 
X-CRM114-Status: UNSURE (   9.12  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Zenghui,

On Mon, 23 Nov 2026 at 09:17, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> Hi Fuad,
>
> Thanks for Cc'ing me on the GIC stuff. I'm happy to read them ;-)

Thank you for the reviews! :)

[...]
> Nitpick: would "irqchip/gic-v4.1:" be a better prefix for this patch?

I'll use that in v3.

Cheers,
/fuad

