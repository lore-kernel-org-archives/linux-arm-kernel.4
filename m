Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAE5606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=odVloOrY;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Bphlk1eH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3pk5DW/V6VeFLnQOE3OY9sAFDQ/PzjxAc+hYqzj2LB8=; b=odVloOrYkPNvR2
	/GiRB82/GjVcrkPFW4wan3nU4kZoPrNba4xLdiMg+O8Cm34mqMS+Th/mFrMamii2touYU5JiskRkP
	oODiiyhVZZ+toXRv1+SAmzOe4ZMAuFVPO7OOFr1d3MTFeJRhpibK0b9z2PZMO7nYuTES3b/LZrvAX
	4APJL+NtCqNrUp8KA5ZZwfWb9kGNIpW6/bcj9Wb1FB9wYvk29XdgylG806MBAd15R+ALlkRhbdAxM
	NCPpimcdWIc1OaZaUjlZkJu40wE73nsHSL6hTr7GSyaIw2xIIJqUzCNXqZcn6Cw/dRP1ygtbhlLLy
	zc/T/shSBhYCm2qxbClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrBe-00000004sBD-3A3h;
	Tue, 10 Nov 2026 19:07:18 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrBa-00000004sAp-1r4Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 19:07:17 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1503862a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:07:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337633; x=1794942433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pk5DW/V6VeFLnQOE3OY9sAFDQ/PzjxAc+hYqzj2LB8=;
        b=ZNh+TKDIIDVUfNM1KMZK7H/wqjZcq4ph1xhYZPFgUHG2JhaFJwkXqvuP9qoJ36+wud
         qKb0NwROx/RXTMd05P6DUPN5oLyp735u64GsoLgCTdmFS/RD1kRmR08gouVLSeUd4e0N
         +qE1D1t1510AxmfKUilndMgpXfvNcLzI73lFve5eSFs9wZjRT/xds0mX5LxOL50sVhNP
         FReos8ZcB7PyB4vfaxMbPq/UNq4pfd4pGechx/hRyBBlJAWhSWzTZ9Ybcze0iwdEOiDd
         fovmKQZ1WwPJyH4R326IARpPeqVbZg9N44bxQ5BTFAe13USWjIj/v+/+ejIul6SrhjI1
         iXmQ==
X-Forwarded-Encrypted: i=1; AL+hErEtYy6TdGbJx0g7gnXeCe0gFTHFmjC7GgAygW0CazWJj4ZK18rFACHY/k5AluvghvbiDWfDiOc0p4FNCJzTW3h6@lists.infradead.org
X-Gm-Message-State: APuU4Z9cL5F+WSvJHBZVCby7GHs/4oLPHSxAam1i1dq6rLr6CkCOiP9+
	ivfE0GvCn5jYLnupOVz0vP//yqwmQrDMCNx3q0eYttuR9K0UUaHEcbHM5XD/NdcXLemo0dmNNzh
	2GeO5d3PZ/MmpakugDhLkqWd5AFpkKaja+jQ+cNpuLEYipq4iDs4XaVSCEYZQjaqjuKTYBOD8P2
	FcRA6cWPeoTP+251a0FLw8ifvxuZOhNp+cYbeWJpn6KRicIab/6YB5p/edxt0nTz8WVQG+Skrk+
	mvacl0vbQLVFobt+TpIf94d4qAVEdMChpA=
X-Gm-Gg: AYBFou08aPNcaic4D+xGZbe3vT0IzY3hwAnW6alIrh1dYhqCfXhtsZ7dFSla/ASb0HB
	gedzpEBUeA4/MLfbpubo550l97vLq806jbL6yWY7/Bz7+mSiR1J1e5l/txagKY88xzIDeFbUshV
	DdTI2MflKsBe+6FR6aaHNY3r/IKM485ntzAaOVBGLqzgSVDvb+h2wUfv0tqP03sFPviZYyIsN7x
	GEWZM2K1I/Zs0/JboVqFWY4bk+SdedpLapeCr57n/TyIFXzNoORxeXBAO1jFeruhCPIcFD9JF/k
	z4/o0eHV4pnvkcZLHGin4yci0oaq6oyDdeHQxU4LdkYMtWvWmUGR3yS+ODKXXD/pbfIThUsRMM+
	3XX55BB3vXzmTCwI5gbn1QgfYljFNXI3ZQGhkZp/3FDUavxxMeOa292fQyS5kEvhJHZJAfu1aoO
	MJnhf1tjnyrzuGiQS//RGVAyKr5vUfhI11krEeKDT1
X-Received: by 2002:a17:90b:2707:b0:3b0:9e2c:9b61 with SMTP id 98e67ed59e1d1-3b166cf6979mr3672302a91.35.1794337632731;
        Tue, 10 Nov 2026 11:07:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b17db57cdcsm406197a91.5.2026.11.10.11.07.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 11:07:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so2746991a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794337631; x=1794942431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pk5DW/V6VeFLnQOE3OY9sAFDQ/PzjxAc+hYqzj2LB8=;
        b=Bphlk1eHgYl509TbK2mjAs+B2rwp4++CaljdvbK/KsWNas2F6yh16MWf/UR5HEODKo
         eJzT1cZxfaOHvTgxhvWqfCxRrAeKEXMYX7b0MtT6ZyWqhfo1TlPII0PKNfXHnfo6rtTk
         syUq2O8JLpbSWYCvxTIRdYwx9gA9uFiwIjt7o=
X-Forwarded-Encrypted: i=1; AL+hErHtartRdVQGK+AIEt4xKoJSKenwjeu8UfsiDmY+p4Xb8ITUeLp2XODVJTFpHgeJyG4HCvZqrEKSerExzISZ3eXP@lists.infradead.org
X-Received: by 2002:a17:90b:3902:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b166cc1512mr3321462a91.21.1794337631054;
        Tue, 10 Nov 2026 11:07:11 -0800 (PST)
X-Received: by 2002:a17:90b:3902:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b166cc1512mr3321420a91.21.1794337630434;
        Tue, 10 Nov 2026 11:07:10 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm862880a91.11.2026.11.10.11.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:07:08 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable method
Date: Tue, 10 Nov 2026 11:07:05 -0800
Message-ID: <20261110190705.2345733-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-1-4103df2588d3@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org> <20261105-genexis-xg6846-smp-v7-3-rc1-v5-1-4103df2588d3@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_110714_538478_F2244661 
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 05 Nov 2026 14:24:46 +0100, Linus Walleij <linusw@kernel.org> wrote:
> BCMBCA systems booted through CFE can release a secondary CPU by
> writing its ARM-state entry address to a 32-bit MMIO mailbox and
> sending a wakeup interrupt.
> 
> Document brcm,bca-smp and its single-cell cpu-release-addr property.
> Require the mailbox address on CPU1, which CFE leaves in a holding pen.
> CPU0 is already running and does not need a release address. Add a
> Cortex-A7 example with the mailbox address only on CPU1.
> 
> Suggested-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/soc/next, thanks!
--
Florian

