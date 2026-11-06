Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F43B606D828
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 23:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vx2weHv4;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IBVCC6a0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yqLXf+mGS/hVPryb9Jb5sGJOrOI1a/GtAPkODUpEuoM=; b=Vx2weHv4u8oXm1jCsqEsvRAZS8
	NauQ1u2/jON8lnVbDSic1Y7MaP5+ZxiZasAQgSBIgaZclYiLb1czij3KphHpUVPoRbeMopIHaIIzC
	F2vmLfSx153SKjfa7ThgBcogLi1Ak+SHbTKoORs1FF2LcA5+awWxH/hJ4OdaKeYPzYFt46Z1/b3Mo
	f3gCaE5EDCea43H4fkwW0IxT9SaIBhJFK87zCq/tfVg2tPKjELMFPgFC/Z3i3yOtlOOQxvJQzwi+g
	nxmm8zUCGYtL09WR8n6rdhg2Gkb17LZwcm+goqTBmeBoyhqEVzv+ACfalRa2uH5oytBWyW55/XKbr
	aAaEkCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTqX-0000000Dt8D-2Yn5;
	Fri, 06 Nov 2026 23:59:49 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPTqU-0000000Dt7u-3OjM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 23:59:48 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso711856a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 15:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794009586; x=1794614386; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqLXf+mGS/hVPryb9Jb5sGJOrOI1a/GtAPkODUpEuoM=;
        b=IBVCC6a0jN99Vz21a8aEdL2cxeNpO9sUxneOVwiK0SoZurDXB+sbNOVRcE5/0hWIAH
         NCETAGKFTJ3f1YJ/xr3g96VS0S3wrd5VXqSbTZCeFPXc3qsf/fE7EGWwW8SxBunzOhtY
         MuRtZWzS9uHFKUPYGD10UIouIFC9VrRipmE0IQqszTGMsk6ozdsova5IRBkSk+KhGjtD
         DZaSdiuuE9mgtlxiQMqVl/QvsnCzMuMVr9a7EBRZ/nYbMoWsfsPz1jDsztUeScbiBAPo
         29lxDHf3wqyckif67Kl9G2wbxm/DCWuJeY19LOvaQVf3nWMrf8ivql7Eae/wYgXOUN7W
         T5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794009586; x=1794614386;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqLXf+mGS/hVPryb9Jb5sGJOrOI1a/GtAPkODUpEuoM=;
        b=RsxDHiW0xrqwkObu52/IF6aEG/4hIU6MYUKM2HVNEfCHtVgzzycZNPdSDV4fThdRmJ
         uOtv9WHcVOKe+pMxzTeruKdz47mWe/E+FrARYabP+IW7EMcDb5l9qd6G70fo6hVstFmh
         Rbj2aYbo6PO5yrl95z1VU8Jn9u7B9D9CjgHSWC19Y605mHeibiL9MzMMGQYOp8DGm5gH
         fX4kUJzDKoaFr/S3K8bNt6K2fM+jVFnc/WwOtVohHf/7WmMEa88PQF0m1w2/zqc7HEAm
         yybO7TUw0t0ru+wdQ4Q9ehcQ4/tOrZNJqd/aAD7Y5OrB7TdLD6yVfA5MSIMR/8vqW8Jb
         lWRw==
X-Forwarded-Encrypted: i=1; AL+hErE7hhIJ3LlFQqV2w+LC2EW5P5fyPiJ+Uu932slrp+2VaeRjv/CpOSkrc1+j1siJxBY1q3dJrGpPXPsIyQy7vI2N@lists.infradead.org
X-Gm-Message-State: APuU4Z8iBf30asWGW4jNjOevCJcghlktLlHiMZ+yeeos6T8RbsfvJOuS
	KMBCTk1zl+bbk+P2s7t1mZfrsyqMgfVIJVKSMQq69Ol6Zoshx/uyqcwI
X-Gm-Gg: AYBFou1B9zvOfzkPfJJLHECP9wLu79zm/g6ZSXwlnxgLP/0zzdvze3n38+kttSEaeTe
	MrprLNbQmodPeTQrB+aLWdf9ryBkcvoSJovcW7pEMCrUNHR8rZA9e2MzLC2h8giRrqiiCzNENaN
	906IePIDbmJamGkTt5wE6/IRFvK/Pzsbl+qraf4hQUnOumGdgM8uPQVJpmqNMDEZ8H6Z9t6r2yw
	cfH6VZfXXm4JmY6PZBrftlONtAZR6j5azvXO8uZokN4P8Z5W4sjlaK4EpzSe+l4xks41M00745z
	FFItvJDMBV5AVnq0H5Tr7I0zzA6n7UTvPrTBT6kRW3QI/CQ2mNQPFtpyDDoy/+LN5lIaefZNsNK
	i6uxCPTpqmrm0Av5ZkxggZp2ZY9Pb5h08QBvgjlru9KP+aKpdJW/+eMBf7ruE4V6NeBDbB+QwA1
	FCdpVCvKtnUcL8S7+oEUmAQyrF3TU0jn5+ARNJVp11SgIYPrIQaWfX9ypMOdTldhZzi4ajGv1/d
	omlDLLOPkJ5YAb0JTGaualwFwt97DTxSJbxb7HQYr4HmSAl0bsj
X-Received: by 2002:a17:90b:5307:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3b0db6c9e98mr4130726a91.25.1794009585770;
        Fri, 06 Nov 2026 15:59:45 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10581caccsm750767a91.10.2026.11.06.15.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:59:45 -0800 (PST)
Date: Fri, 06 Nov 2026 15:59:45 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH 0/2] arm64: errata: Fix two Kconfig column entries
In-Reply-To: <20261106235616.1533003-1-takano32@gmail.com>
References: <20261106235616.1533003-1-takano32@gmail.com>
Message-ID: <duplicate-notice-20261106-takano32@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_155946_879733_2F1476D3 
X-CRM114-Status: UNSURE (   7.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Please disregard this copy -- it is a duplicate of the series sent
earlier as <20261106234541.1474324-1-takano32@gmail.com>.

Sorry for the noise.

