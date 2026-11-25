Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18333606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JdX1Fz2n;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=auEWpafx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mZc2jCgr+ZEG71mhrtI7bu0QzE46TwhUiStHpCur4nU=; b=JdX1Fz2n/V+t/P5Ix6r45ewkhX
	AK3dWbPsxKQNiBHRPzsKZdoqn08hO7DD3hqWjCXPJFLzqZnRhiEAFiYqqCgSGqP6m+Td5UyPnAqeW
	MdTY7LHLP9DZoa6gxQEN9Q+b3aqwLoA/7oYa/MB9362XbfE5IeHv52VGSzVCSPgmwoTnyWGqdTdI8
	VB7SNzPx+COqRoQzwA94lZdnyV+ZNB6UShz5sBiT3aTivMvGQGpuz236T9XhyMkwdJtNtUiWTd3HB
	Q30sv1cbKVe+ENaMFX6hHRL7BiNMIavBAUvzH8NnAZhPi8HvTpcfUSZTcsjxD6JIEK4KnwLrCrspp
	E1y1MlDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDy2-0000000A9zV-0cIt;
	Wed, 25 Nov 2026 14:27:26 +0000
Received: from out-11.mta0.migadu.com ([2001:41d0:1004:224b::b] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDxz-0000000A9yp-1Isp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:27:25 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mZc2jCgr+ZEG71mhrtI7bu0QzE46TwhUiStHpCur4nU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795616841; v=1; x=1796221641;
 b=auEWpafxO5FC+N+IWoifGbM9SehItG+Z6S+6/YE/iLY6kN8nvAGhZGwh2h+vw/aJTHnApfU8
 XnNjcl1SnhqgTMKW5F4/okMoSfE3SutzqfqX2XrEkXjE93XhhbPApcYyRGFOGNPo34i30u1pTv9
 Rdj6/txOJ72bH2QiXYfXyFkM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 23024a20e052f228;
	Wed, 25 Nov 2026 14:27:21 +0000
X-Mizu-Trace-ID: 23024a20e052f228
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so35948e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:27:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHJa/LrE8x1MW9nfEuxPAV5h2ETp9DkRz4untZvobSLOSbwOj0wjSXlI4Cf+Wgfv3pJ2Ctx+jObp4WMIrarVXEP@lists.infradead.org
X-Gm-Message-State: APuU4Z/oYD1ysVH3aSi3C3Fc7SvVMdMRELQoFheVHsW2Znm9AKumvMeB
	TqMXeEvfeJKKmWVDeXlZpeGAIXpTzh+BMgIGYOccANCHMDnm+q9p93EXr34FxqY9rcazUuomK4I
	C+4kR4i5UP0llneO8e67VDf1da0sxNVXiWaoBrGBi
X-Received: by 2002:a05:6512:3ca7:b0:5bf:f060:c0f3 with SMTP id
 2adb3069b0e04-5c21a26fab2mr555752e87.12.1795616839635; Wed, 25 Nov 2026
 06:27:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104140612.137869-1-vdonnefort@google.com>
In-Reply-To: <20261104140612.137869-1-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 25 Nov 2026 14:26:43 +0000
X-Gmail-Original-Message-ID: <CA+EHjTy=DTmPBQd1tiM2Qo9CN=wRJT_S+7fX5u+gwUTWXK9+Rw@mail.gmail.com>
X-Gm-Features: Aa3M54pbT2MD_xSnGtMFqbfMy5Tkwgi8UvFa3y0WAMmC7PRuqL5G_h-h3jfQvGU
Message-ID: <CA+EHjTy=DTmPBQd1tiM2Qo9CN=wRJT_S+7fX5u+gwUTWXK9+Rw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] KVM: arm64: pkvm: Extend hypervisor entering
 tracing reasons
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_062723_637563_0494DF8B 
X-CRM114-Status: UNSURE (   5.28  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

For the series:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Tested on QEMU with the hypervisor trace enabled, running protected
and non-protected guests in pKVM and a non-protected guest in nVHE.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

