Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CE9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M7wMbkvM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDIFlsTF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lV8e6DuZQ+gcSvtMbjrorr5ZEnQbK8gl52vAPo45Rbw=; b=M7wMbkvMhU6W5f
	aibzdvqdbJamw2Ljf/BNnnliAJ1RpcIjL+n/mBaAwYlWYp+ouz/7mReiEwPsHb8GJIwbISEh3gxZp
	Pi/DEbPy/cVyfyQ+h40TP6FAUYOg6mHow1ZM8/3nCVra1x/C3C2OrOB2uQD6rDxAQ+kz/4Aeim3pL
	ZXAkmLqDqQPXj98rV6hnLp/EQl62NjfEr4UaBoLo3ORCsHBKdCq87Uao4v9Zb6nG0KZZVLstml9aQ
	dd6I3bfKOwB9REfXseBa5uixCpNNvilljv+7ahGfX08zZcBugJeca6fV+M4Lz4NHxuSh/+iDpkQGH
	1t/vYZsh+3+sUB51IA4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRA4X-0000000749R-1n47;
	Wed, 11 Nov 2026 15:17:13 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRA4V-0000000748u-0mdF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 15:17:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so20098975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 07:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794410229; x=1795015029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lV8e6DuZQ+gcSvtMbjrorr5ZEnQbK8gl52vAPo45Rbw=;
        b=fDIFlsTFTJaWwhdN6V2t+PEbpZtcWnatjaZ3z1KIxVAuLFLyzo6z96fMuKuteTBHo7
         oJ9TX8vTgcNoSvJTyra+6Qa5xfTCfVj1S6f0plyH5jH905Ezn74rVHSlAop/UOVYPuwC
         Wq0hMXFgYCEItpaNTCtVnxQYAtJstD6RUtgoOBdns6+e/dAjW+FROnWaXRb+ZVXdytsB
         YotlK8BNhRFNCnLIvqx3tk4sLnSkmHTd+RQNLZVixCKqIhRGGhl7eP7C+DFYVFpPZXUy
         QLgEc/nnQQJzyLgKIsBE5plRQaX+ZJW6J0oUxe6xvYYyc+tCsiWmbAC5su8HrX1TsE9O
         7+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410229; x=1795015029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lV8e6DuZQ+gcSvtMbjrorr5ZEnQbK8gl52vAPo45Rbw=;
        b=opEOaxeQhdXXZkdb+iSSjgeo8qlFv4ZU4fiqSZcHPN2JriHdUdUkd756XN6/FNvs64
         dzoLdOH7pXKaVFIWwKYaBg/Wop+tUPtQy8gWYg0QS/lTFRmH718a8XuhuynO89pj1s8x
         xH/RNF3ENzv6S93+NbJ96Z/1BPGgVob7/tUQmh0B8Mk7b68IbaV/f0E41tcNf7wbwW4+
         c6Gx323TtOUmM+6nzdqOJTDwa7+9AFdVtmWsHMoDn3snSj8RCWR3WHV0OEVrDIV9rqTg
         4x3b3q2Cs6mNyajhP5Ut7fxD6iSu/CD2GHQ3YGJbDRTlhQOHfWBUwSls4nkQ4tViZWfL
         2gAA==
X-Forwarded-Encrypted: i=1; AL+hErFDfGlFjHo6040TQ09BG5FaTS/zT9R8VJlbzlrpsent1coyg0ovHr/591jtNYGo3WpgQFCM/oAz4e9yldqf0M2U@lists.infradead.org
X-Gm-Message-State: APuU4Z9+Oq/NMYdllj9Y7dM+Lu0ofZWUq3MsBT45ByYGb0gTxdQ0C82r
	ys5Fk+cQHZnQVejgqOGtA5SwVj+aA4vsh+OUBIle3MN/Q6J8GZ6+h1UR
X-Gm-Gg: AYBFou3CHAbb5XfwQ2BNng3X+lBGTd4cRB1vKP3P/DcyW5Wy6khjLu0/7Jiz0hnKmum
	vsbjibHrnsNtvf95grKmI4Y2r4ovSfnqis9o32e5aPoAeRG2wD9wN5GQPJClnU+YbAhU0rmyBiU
	8wTuokac9ohzGscBCQqH7HJAWjY4XE2XC7ON9kNRYK2oWFAzv5JU3cTzWsAoRKuaeIh455QombO
	Pw5oK5T/7t56amIAgZQCM5gtWM1FjydjyVU+51TVfeDqSBLl7m7JxH1ICTMrEhAb/dVZJjXnyyw
	prxe6+DiYW3dHU/irdbUg52Hw9Y/p4CSL75ZfhFWaVyMx3O0Lcvgv3PSpNdC3o90yvfIhzEgAG8
	k2q+yaLdPQGF4BIa+KVkZ+uVmJgAQEgP2tqPmLS8XV9cih5BWPFSRxeHh0jr8sv/OBhyZQYODNN
	H7XgcVNH7Oxa4GM/2aNbcDHJIJc5L4+1aCHq4Tw5d1Y4+fuHLE/U/EOKUPWyoH7K/AOYMFIAUdI
	AjsqjRLpd7P3aOhv5QYBHIRmxzmw6WGnmx8GC+Xy+mrd/yWS1b+FsymRbAVgHzoW3YohTnqPBsv
	RWlT0cqWOLj3dCwKtn97Yv4tSPTSUSMWsBVNGDh6mWhrUhJt0sH8kE6N
X-Received: by 2002:a05:6000:250b:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-499c7b1bb2amr4471623f8f.46.1794410229162;
        Wed, 11 Nov 2026 07:17:09 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm10149677f8f.20.2026.11.11.07.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:17:08 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Wed, 11 Nov 2026 16:17:07 +0100
Message-Id: <20261111151707.2253768-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <49846243-34ae-4643-9b39-1537947fbd96@app.fastmail.com>
References: <20261111133930.3665251-1-isasmendi.agus@gmail.com> <20261111133930.3665251-3-isasmendi.agus@gmail.com> <49846243-34ae-4643-9b39-1537947fbd96@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_071711_389210_3F0012B2 
X-CRM114-Status: GOOD (  18.44  )
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

On Wed, Nov 11, 2026 at 14:56, Arnd Bergmann wrote:
> It is a little strange to use the MMIO registers of a status="disabled"
> device to turn it off, and it would be nice if we could require
> the firmware to leave it in a consistent state instead, but I assume
> you can't do that for the one device you are interested in because
> you don't have the firmware sources, right?

On the H3600 the firmware leaves it off (control register 0 at kernel
entry, cold and warm; the bootloader never touches the controller), so
this board only needs the early return.  To be honest I also prefer
the firmware to be responsible for leaving the cache off when the
device tree disables it; I went the conservative way for a firmware I
do not control.

If you agree, v2 drops the disable path and patch 1, keeps just the
early return, and adds a line to the binding saying so.  Otherwise I
keep the check and add the comment.

Agustin

