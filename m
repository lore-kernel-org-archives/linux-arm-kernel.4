Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28614606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 21:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2+jwlCoX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dGSuuXIW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SJH68/COfyvgePXxUDhK6tjwJvIpIRYp5jUXCkHgbaI=; b=2+jwlCoXo2Ak5p4ENyujSBrHLN
	KZdou39PhSlZvurzl1ofqg48d82ShcLRTUr4VYHcww9NBmcqONJjDG3YUtrAErU2+jSb6N2Gc//oU
	Y1o1c0n7t6L8c5adtCLjW73hGSUO7f/RjORjuOafF/T61eNNJ0NLuYTy+c/4dgBUPweOZwhkBtdIt
	zJTzBzqNSzly65SblSvNZpid9KfDlBKq1wmJo4CKcJi0j2V+gUidayGU/T4uR/HZCfECB14n6/JgO
	S0jAUSoHD/VNR1H7fXfSyxyNi1bnk5v0FbH/pR585X+ykNIP5/cCIfbTlE4vTe5yzIDbZFw1pQcsM
	/LI4OvpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKrS-0000000GlMc-2atK;
	Sat, 14 Nov 2026 21:00:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKrR-0000000GlMU-1pC5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 21:00:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id B429441F97;
	Sat, 14 Nov 2026 21:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id ECD091F000C4;
	Sat, 14 Nov 2026 21:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794690032;
	bh=SJH68/COfyvgePXxUDhK6tjwJvIpIRYp5jUXCkHgbaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dGSuuXIW2fiDlGuT/Ku96ytrVsVSlzF1Lgr0obnt2uXIVyVztUyEMYF/dqnXXJSIc
	 7dRDBZY/xshq+z5uIBHlGuYFMpoup8s16BQQZ1SyKZ5tMeixtfNiYf3NjwUldaZPpQ
	 CMm3z6wUYEt9nBO59RFM/ix8qh53Gvel0O/F0A+HQiSfJbSnP1Ul17+5HF6JHNgcuu
	 8fgGJhUXvPD5boiNEWN+1IBvqeOewNa4OHYI6SR6+I+isCtPGOIcZeBDTA1f5aFjST
	 GJlca8czrfp/98f6yA88gFMdQ/GSeZ0+n0RM56fVKNLTZmGFy1kondZAde7E2OWeGV
	 lRK7HMtLTJspA==
Date: Sat, 14 Nov 2026 23:00:28 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Stuart Yoder <stuart.yoder@arm.com>, apais@microsoft.com,
	rlmenge@gmail.com, hargar@linux.microsoft.com,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] tpm: Cache TPM2 start method
Message-ID: <avjL7GI0qQJ47lF-@kernel.org>
References: <20261114193434.117714-1-sidchintamaneni@gmail.com>
 <20261114193434.117714-2-sidchintamaneni@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114193434.117714-2-sidchintamaneni@gmail.com>
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

On Sat, Nov 14, 2026 at 07:34:31PM +0000, Siddharth Chintamaneni wrote:
> +		status = acpi_get_table(ACPI_SIG_TPM2, 1,
> +					(struct acpi_table_header **)&tbl);

Nit: no need to split into two lines and I think you can also express
this in more compact way:

	status = acpi_get_table(ACPI_SIG_TPM2, 1, (typeof(*tbl) **)&tbl);

Br, Jarkko

