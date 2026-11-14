Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ABF606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 12:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MFD6Jdv9;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=L4zuBYhl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RIAjwWAB/1kSNYGnZwFAsdhypWK0Kwmt4wTEOFin5Vs=; b=MFD6Jdv9NNyT8E
	az8HlSaTZmPAaB8A9o+hpzBANfTxXw9a77yDwt6XHRg9rJplrde+g1cpBZDDZezD5U51/Kn+I+Ged
	NquqSZWGnUbazx5hHODxsHH7jtKY8jd/r/sL+5kobvxtBCfmlpzKUaNsoHNve51i7/izxfu0OwAey
	tPrHFPXcdrntXn2NInaOVWn53hqGPMKLfjdZ7UkQNh+gJeYE44I0ai7e3p1NF/8UHt7hIvarsr1Qt
	gL1lo8PhZA0Ru21dsD9aeorNi6BzEWWGUnF3kY5dsPJYN7ZVcjKpojm6sDNQLZTdicXsbsKFf3y1L
	hsohsN4+4KMPkIUj4rOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDHl-0000000G21n-04RV;
	Sat, 14 Nov 2026 12:55:13 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDHi-0000000G212-13o0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 12:55:11 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so3572297eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 04:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794660909; x=1795265709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIAjwWAB/1kSNYGnZwFAsdhypWK0Kwmt4wTEOFin5Vs=;
        b=L4zuBYhlD0hEFU4y2zOo/g+fcpnX5WTk/qb2wkd68D55kq1DWt5NHRDMDXwCPMgkC6
         +MevVR88VsHDUNYrJgjhXCBerWqs/CfFhABwp1RePct6LyYC/tZjLvFLpKfcnmBj0tsA
         Pnv51274FZJo3b+Ai5hwAiF5Qf9+6R7EDNKt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660909; x=1795265709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIAjwWAB/1kSNYGnZwFAsdhypWK0Kwmt4wTEOFin5Vs=;
        b=seN0y7+AVdh8gr9WZUIsS+VpbXdZqG4ekyysYp3mgxRAgn3BPJGN4afF6DvmhVnpEr
         fN5eR/qNZ6M1c1QNKGFH8seBVErXv4Qdr5/P7dk8NRVh/R7nmAwXl9kz2RZQ58fjhFhj
         AQMMscHyZbYC6rBSqaT7EB2s9fj8SpNAnxhW/HmCYkOTQCzwrVwX0lP0uaMRFqb143HJ
         vWSg2b7KVhIV6U0Yh99NXpVQIINsw1sY8XaiP/8KvpCNVfQhjmHVw4imMEP+GyrW54ND
         9H8FkcOK2UEU/BNwDdfvlQ9wPacp+iCLxmSQVeAkZ+41hVtQ6bax3xOF3dYB8Xba0Qo1
         ARUA==
X-Forwarded-Encrypted: i=1; AL+hErHtKzlIK5h0W6Vqe9Dore1n/wtZQyulHAp6XrOhKOcT7RrGU3nVf3WvFnYhfOvO4kWgDu2Gz6pg8uPZcEeJS+nf@lists.infradead.org
X-Gm-Message-State: APuU4Z+pO4DWK94NQH8OSgrUcffrkARsAsbQdvL7v1ZB64lkdrEnal4P
	rXVacsRspU0b13eJjAb6JGCIYzgfUcq0JsVqDZ0Luj66mFFlSJQunnJf2G2lNy7NH0c=
X-Gm-Gg: AYBFou3j2p5qTRv2gPnhJ6qx/kh4OVjgksl8llPJzwnr/nUapZs37Yo/ZRxRUuXOIEV
	4Zwr6D8qBDo/oQySWWogWemRIGk0QWA6XRqKiQAUfjq+zaulnVm5aODYHazAzP+5UA+BvW3BHbv
	GaJEKdpymf9UrVLxvdnBTmAZGQseravQSm5ILX9oM4aJa8ChSOXdm4x4wo7964LrtGKmlXFEuJI
	YKIyX5xHskwihimvwcC6vZKru3+1qwvPyAwQgb6gkA1qntpGkqSyw1wFsqxJDHALPxfpP/+0pOB
	c3n3h5f/o8Xk4wWXIJOjFsBdPamP2pGpoIeX0BA1wRwD2u2rXANOoyBmClDopfIpYZNQ66KbAVL
	sH4VOMYdeN27HT/1enaKfZXR71USs4Vyb0hppRzKgKpm6ttRu3J6Csu65oImKdWDPTwYrrr7Bgw
	36KsU1u5N62T45odFrvgMvysuovj4ZPA2FQIlni+B0JNADQ5zicjlq2nEx95QeVCqKDz/mBr5Oa
	ZqCGCYJcagZVPG/u8Lgw0IvpZ8Z9GoiwbY+oUXnRDZo+pIY9em9SZHIPhBmt5C6TNPDXc0mAGTE
	pnB2apFWZKtBc0TreRqucIqYABWLi4IVWTOdnHBVtU+UGPJJsFSwK8KVNvUqszAJn1gGU92ePCs
	0Y9mcodCM7BYW
X-Received: by 2002:a05:7301:1528:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-37966d4077dmr4508914eec.26.1794660909271;
        Sat, 14 Nov 2026 04:55:09 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm15904809eec.6.2026.11.14.04.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:55:08 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: ulf.hansson@oss.qualcomm.com,
	ulfh@kernel.org,
	heiko@sntech.de,
	finley.xiao@rock-chips.com,
	shawn.lin@rock-chips.com,
	sebastian.reichel@collabora.com,
	vlwwwwww@gmail.com,
	leonard@lausen.nl,
	abel.vesa@oss.qualcomm.com,
	tomeu@tomeuvizoso.net,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 1/3] pmdomain: rockchip: switch off the subdomains of a regulator domain at probe
Date: Sat, 14 Nov 2026 21:54:53 +0900
Message-ID: <20261114125459.10030-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <733b921576828ca70a3f5048691400130f8a5dbc.1794615323.git.gahing@gahingwoo.com>
References: <cover.1794615323.git.gahing@gahingwoo.com> <733b921576828ca70a3f5048691400130f8a5dbc.1794615323.git.gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_045510_293055_AEDCAF29 
X-CRM114-Status: UNSURE (   8.63  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 04:04:59PM +1300, Jiaxing Hu wrote:
> Mark a regulator domain and every domain below it as off when it is
> added, and once the subtree is complete, switch it off from the leaves
> up. If a subdomain fails to switch off, leave its parents on and warn.

This also changes probe on RK3588, where npu, gpu and vcodec are
regulator domains, so I booted it on a ROCK 5B+ (backported to 7.2).
It boots as before: the NPU and GPU work, the video codecs probe, and
there are no new warnings.

Tested-by: Sidong Yang <sidong.yang@furiosa.ai> # RK3588, ROCK 5B+

Thanks,
Sidong

