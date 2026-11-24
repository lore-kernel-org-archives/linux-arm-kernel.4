Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5FE606A6B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=txqVOMAK;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bWZhVc26
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t2pMZHTPWQHTXaMIuwvZv4SwKto2BO2qab0ldpAoWoc=; b=txqVOMAKGluThZ3UHU7qs8v5Rb
	Ut5M8YBhugnvhJC+q/q+ObsFNuwcJuokieYGaUvXvLdOWWCnV3+1akiC7eYCN8lMK/cd6Fm/1rwRj
	dSJbf4P4cBk7Uybq0C1RD7OiolQAXmItsUj3/OsqUKlTpXk2FPkX4nfX8y+bCnKEZF5/MvJTvNY54
	JiVfw4lFqwLGuN+4bgZKVY2l2eRgRtosdQyBO0nNprTjSBvGBT6AA0Fva2AIF5HA7UwKklt3agLHv
	DYsFpJR7pbsvHyfhqgCVryFoUtnHUV6Iu984AnkV7cc6nW9d1rxNVZaPTD6I0fBi7x5/RPQMwFUxa
	1mrz9dHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn4i-000000066Aq-3i0a;
	Tue, 24 Nov 2026 09:44:32 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn4b-0000000668n-2CTZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:44:29 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=t2pMZHTPWQHTXaMIuwvZv4SwKto2BO2qab0ldpAoWoc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795513463; v=1; x=1796118263;
 b=bWZhVc264Vk1CKw83w906H7hd5mA6ErcISh0rWGx5a5f02rjjLGE/1rcONEk4A4NueEB3nmi
 MLNxSjqiK3AmhW0eUrBIC+FXR/jLo07gCr2oYwK37W2/9gco08A28ZBf9xfHzK737H8u+NcaiX+
 IMtKD0hRDzYhk8i0EdcQQxRI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 35218ed9dd98760a;
	Tue, 24 Nov 2026 09:44:23 +0000
X-Mizu-Trace-ID: 35218ed9dd98760a
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso16233e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 01:44:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGRx7/f4lp0jSUVraa66Ai17hho61Qf4oV7qh2hWQn70gpLXxbVJ6gJerTb5TgdIt7eYv5FfGuO2FclBIxsbQKd@lists.infradead.org
X-Gm-Message-State: APuU4Z8tAak2rn6fbok4EqeeLVJM2bbPKPHtO4YnMUKCMvXH5iWTEULe
	HnkSAVLO7FQfYct6jmmOuvqdhnRAEr34MLc7o1D0//SjRZunJTGP1TnOuF0wK1oWNOuTkrPSenX
	K+82NlL+4EsIm1VXJo/ifsg4OmuxhjQWwEEdwOl9t
X-Received: by 2002:a05:6512:1282:b0:5c1:a880:e5b9 with SMTP id
 2adb3069b0e04-5c1fbb1e9acmr387548e87.7.1795513461120; Tue, 24 Nov 2026
 01:44:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123192457.8700-1-maz@kernel.org>
In-Reply-To: <20261123192457.8700-1-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 24 Nov 2026 09:44:00 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyton41ATTfGNDdF7KU0_9xvGuPx_EP=TeA7n8cMuA-2g@mail.gmail.com>
X-Gm-Features: Aa3M54pK544jqTysiDZQ3nSJIC4yYFvop17y-HAYPW-8_pI4HirsHCc0nJyGc48
Message-ID: <CA+EHjTyton41ATTfGNDdF7KU0_9xvGuPx_EP=TeA7n8cMuA-2g@mail.gmail.com>
Subject: Re: [PATCH 0/3] KVM: arm64: Convert GIC idreg sanitisation to the
 confic framework
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_014425_776252_44742458 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

Hi Marc,

On Mon, 23 Nov 2026 19:24:54 +0000, Marc Zyngier <maz@kernel.org> wrote:
> Having started adding some sanitisation code in the idreg department
> with ID_AA64MMFR3_EL1.S1P[IO]E, I'm back with some more and trying to
> wrestle the GIC into submission...
[...]

Tested on QEMU, booting protected and non-protected guests on pKVM,
nVHE and VHE hosts, and running the set_id_regs, vgic_init and no-vgic
selftests on the nVHE and VHE hosts. Also ran the vgic_v5 selftest on
FVP, with and without GCIE_LEGACY.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

