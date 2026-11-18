Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8210C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GTIP13pX;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GyRTgGrD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e4z/RAPfyhYM0nAZxFd/+R4Vt1inNTW4BSIaRYbDcgw=; b=GTIP13pX471KT3nlu/FyvmtPNM
	5sCPyv5l/Aq13u5S1ovR10ehH/5HSDwPKhX9EFXhfAhoP/Jev6GN/UbnKOxetBN24keZy8Gbz8B24
	yQJFV7V+ISwPU2G5kXsb02K3oI5wQv9mAU2KWL9yoNz9bE9NL0PLI3WZwpdOSjyQsS/3LSPbyDFaG
	ZMptJqCg6otgJ3Re7KLqAjzxm2wf8DSe7W48sY/oQkLowP8bABFL6GpKa9JAjbnZeUML9lQ+RkBE6
	FRhPLwg1nP0FZx2RWsicd5Lg9nAkgQf9BvcKyv+/hVwCJjtaVw4jmiCi7tL6b/QmHlMTdb95oudmL
	l+t09rwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmNW-0000000AETB-0eeO;
	Wed, 18 Nov 2026 20:35:38 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmNT-0000000AES4-2d04
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:35:36 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-4dab94dc3e7so2523941b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034134; x=1795638934; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4z/RAPfyhYM0nAZxFd/+R4Vt1inNTW4BSIaRYbDcgw=;
        b=GyRTgGrDDjtixNtSsHE0ObL8TXQfd8XBONGPzG4rZvePW0UuXb53xJzR+xUpV+jFL4
         cBXW1oswECK8+W42AV04jo1D0NrM6usDMmXFHCfX77cskUen5ymaZHh2FHb5SfF122Hw
         AtyduWuVNm38lKJ+RNerkVeJbZT+QQuJUzuQa/ZWKiCV0FYMhJ5DKIJsJMxAUXwHatzU
         /LGwNkdXOIOAQm+8XHgwNUywFJuXh6uNqr8rYrtLMjEXwJ7pfRJ5pqur+IoKrpctDBHT
         jPu/Jq4Y2x67YjLKTzwitovbTW1lMsZgktNmhcnZHXnFXebLG//ychqJMo8vdgQdHN/1
         UO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034134; x=1795638934;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4z/RAPfyhYM0nAZxFd/+R4Vt1inNTW4BSIaRYbDcgw=;
        b=1l3TGy+2Rkga7wm5ihTGqMSZmTlm0x0unOSziiWpC61S6eseRFdhip6BQFkGjd+HPZ
         AMUfu/84/uQfFRhUG4TosrLbcO3cp3TmHPKgCE4yDUtDwQ5cVluLCHmGsiQWjV1Ck64G
         T3v/QbALxWSgyN6D+5dea2zHicPfe3NDc+c09XzfLqBFN6RFpin04EiRP9xoGnUS1YO3
         jaaoUXYKEkWPYL9gU9kCdiBZ4f8+mJw7UrcJVEhLUFqcrrN2+pUlFVuFGWBBywHlin+W
         jdPGn2HOTf8Q1E7vfyPQIBTxTQBUKjl7GxjNvg5JuObkTh6e/8orv+uXeaiC0xhnhazt
         kxyg==
X-Forwarded-Encrypted: i=1; AL+hErEWKa2RYOjhuUPzxu1DwiK7Dyx9lZBLADfC3A4vzZaKF5Hh4RcKbBXaBa4Sp1lnl3lx6PJVUI+4kGShA7NoZtKX@lists.infradead.org
X-Gm-Message-State: APuU4Z98m40vBWhO/HEgTUmidhwVBcXPjFR/kIRKJaBxbuEjfMht/wZU
	tGHGvPNskgDwez9l9N5EyOkrlC1oavngw4/QGpWUFzd3M+5jFdZwH0VDv/SZ+BngoucIhWrHS7n
	88oaly4hyMKig+t651hjtszPraQ==
X-Received: from ilka13.prod.google.com ([2002:a05:6e02:e0d:b0:549:a2e5:e0b1])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:308b:b0:564:4d77:7051 with SMTP id 5614622812f47-57740a4b41dmr5099085b6e.26.1795034133585;
 Wed, 18 Nov 2026 12:35:33 -0800 (PST)
Date: Wed, 18 Nov 2026 20:35:32 +0000
In-Reply-To: <avzaDnFRQ2GTHDiN@kernel.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117204535.4036191-1-coltonlewis@google.com>
 <20261117204535.4036191-3-coltonlewis@google.com> <avzaDnFRQ2GTHDiN@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118203533.740768-1-coltonlewis@google.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0
 when E2H0 is NI_NV1
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Leonardo Bras <leo.bras@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_123535_672122_F906ABD0 
X-CRM114-Status: UNSURE (   8.86  )
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
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Oliver Upton <oupton@kernel.org> writes:

> Again, comment would be helpful for why this is done from userspace,
> i.e. the RESx as seen from the guest POV is stateful but the value is
> ignored.

Agreed. I added a comment explaining why the RES0/RES1 check is done
from userspace via KVM_SET_ONE_REG rather than inside the guest in v3.

-- Colton

