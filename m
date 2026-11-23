Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEB4606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MEzHsWVU;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FqBl4D3P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5g6rxDcE+XSPvTO4IYmwgvIS3I7HcVTmR8Q7VnCTKgE=; b=MEzHsWVUGdEmCOcbX5IzLrnNGv
	xs230ReqkXUwQ5x6WVjt1xhzeQEiQqn6rBNNNx4sNkieu5hrAqmW0ZQ9s00Z3gzzsGmFSZ60Mx+7g
	oRDn7KuNNrwAVcCurS+87XE4CK1oWbQ0MB/a+AdP9OIzmvlISVNa1ie/lfBrfUsqwcmyvpPPaeeAj
	JRrkXPIGPBLf10UoBVZn/2eDc+rKr8D5UzA/BzsTQw0dbVSoAS5m/jjsko15Grpcb70H2rFYlw8fg
	tq0Sms/ba+nslpbrXaZm9wbDx5EuigfXraj1+X4PxpRhoQIbZy/2extHQHnta+TdysWckhBvXGSmR
	PR3IOs6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQfk-00000002p22-2sj1;
	Mon, 23 Nov 2026 09:49:16 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQfh-00000002ozs-2xkJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:49:15 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6a125f5b317so2994675a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795427351; x=1796032151; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5g6rxDcE+XSPvTO4IYmwgvIS3I7HcVTmR8Q7VnCTKgE=;
        b=FqBl4D3Pz9TpO9YiYHu+iNH0RSK/ptaezCbwXxuOh1O+c1BUhMSEVDGE+sdhebg5YJ
         sSVPDqXs0fuTD6YTkzLZK8baWljPvvpU88/YguwiP6bKYLOctP9T4BQeTfPkXNXH1GEf
         w4vHpkMLeejz+FmgykX7WVneGsxbgIJduakF7zeonSw1021VU+bxa2HHV+coSm72L5Ne
         6fxc/NfaYaRh2DXX524A4AedEzsE6GEO33SbWVrNyURaZ3B/eo2H4h5ecCwka92O0Z08
         Zf2ymPd8tvE/PT7tqyargcGSZP3lQca237zrz/y0/FxWd/qW9/fkxnvKMkIOuYTrvl+x
         WXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427351; x=1796032151;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5g6rxDcE+XSPvTO4IYmwgvIS3I7HcVTmR8Q7VnCTKgE=;
        b=lGeUHFy1mHmaS0qqzvyasVts8si1/O1Lw7FSq+/QXcp9l9Ra9vieWtk2dLPXkHDltb
         pDtiG1Lf4aahffslY18Yb9lq80LnTEVaHtYDGHDB1pRTqxRhSmV6PY6tEC2EFpggat63
         +d4pIKN2GcIBOWE6WXVQbbG+K3dzB3warbIArV3P8Qh/fZhYgzENo4dUbFSVB0GVP3tA
         PTFFlggYSc+7r2Lt8D6/uh7EGCCbqk0mRK/lABwTsXB4YwpxolNwXZy/jzHYIDplPuIz
         CGmbTMqdbq7BcnYHPuCoAP9YNzJ4Me3+X1+W/s54vu1++3GEPWLrWn8Rza9tLd5T/9Da
         zrXQ==
X-Forwarded-Encrypted: i=1; AL+hErEoLp4jflsmNjW/3END4mX0ooq6A53KcANQz7Yoo338aVP4UAvnA24XMQ0WR9GHXzQ1EJwICPKnEnSFi7ZAZPpR@lists.infradead.org
X-Gm-Message-State: APuU4Z/9BDtMo4cLGYUkZfsFYlXfy3aKntCka6wXvX+7LIw6eLlapAQF
	We6jFmq2SFTPq/KLaNnCCgZ/hxjZqUly6OVCGwEj/Wu1K5IWgmXh027EfZruiDOBQwHxOXBkLA=
	=
X-Received: from edtg7.prod.google.com ([2002:aa7:c847:0:b0:6b8:98f6:dcc5])
 (user=mmol job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:46d3:b0:6b6:f429:4802
 with SMTP id 4fb4d7f45d1cf-6ba37ea3508mr5728784a12.25.1795427350480; Mon, 23
 Nov 2026 01:49:10 -0800 (PST)
Date: Mon, 23 Nov 2026 09:48:52 +0000
In-Reply-To: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123094852.2435494-1-mmol@google.com>
Subject: Re: [PATCH v2 00/19] KVM: arm64: selftests: Tests for protected VMs
From: Mihai Moldovanu <mmol@google.com>
To: fuad.tabba@linux.dev
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, 
	qperret@google.com, seanjc@google.com, seiden@linux.ibm.com, shuah@kernel.org, 
	suzuki.poulose@arm.com, tabba@google.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com, Mihai Moldovanu <mmol@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014913_799531_F8FA1C2A 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fuad,

I have tested this series based on v7.4-rc1 in QEMU
with gic-version=3, -cpu max, pauth=off, -smp 4, -m 8G

All pkvm_* selftests pass. I confirmed that the skips you mentioned are
features that pKVM doesn't expose to protected guests.
pkvm_id_regs fails with patch 1 reverted and passes with it applied.
Each patch builds individually (tested with git rebase --exec).

Tested-by: Mihai Moldovanu <mmol@google.com>

Thanks,
Mihai

