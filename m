Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F25F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bj/5ZqfJ;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kj/Q1QBv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EduTdZSqxhoe0+O4YJXgiX7jRForw1G8cwX8mKcHAgA=; b=Bj/5ZqfJ2lzLn6k4cqCl2yw4TK
	BpSjOXv3JJfBjmzMgON6ZtLDqaAzCYsjocGPS/H/4gos1/zNXXfAwcMzEPc6uAxeYUFfTrhZyGeqd
	p9XsYQt5BpwGZf2yqCvznQE35I82SA1G7h4wyBDZ599mljiMG1W2WVxrJBLxsw23Fag3e10dUFAMm
	aO1IOw3wsJ8bAfHf6h6TIsTryAOslDe5t/KPqxefYmCVHw9wCPxqGjmdGqwDDNG+uZBryeEvxLmxo
	ZBXSzixRaBOhG08n0k0AG7tIQvht45VuA5n6Uxo1BmsYKPvEa2WnZxfb6BtBLUpW0u5BSkN7fGBDI
	ruDnEGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVK8-00000003mZG-12Mj;
	Mon, 23 Nov 2026 14:47:16 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVJy-00000003mWP-0IuC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:47:07 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-49034831bb3so2120104f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795445224; x=1796050024; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EduTdZSqxhoe0+O4YJXgiX7jRForw1G8cwX8mKcHAgA=;
        b=Kj/Q1QBvQNbOXNXq+sR638jCxO3KAPB7+apM2we0td4yYZoqhfEvXneidV99kOtSWI
         YaZ+zp6LnmFSUBL0dRCRS//E+ZeCto7B/1u07lhHRCR7pACXOOivV9ogjiHrS9ksKXZI
         HMM7IoIYQZ9fkAG0uf5qsRP5HEXbtcT1nuknwQVccDWx22UlFlFmpnKnb2pOP4lFDhRM
         5rOI2iBrzM6plp40LgZ6DKyw9Zdtvx1aTFYkaxWj7L3Rihy3wV7R6NuWfXVkNPfZ7bNY
         gQet4rL2qNLPwP5y30XN7PbkYWVpjydiCKrhkuE6WSS8IWVLNTCF3wewjiKgLAwUP+7U
         A9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445224; x=1796050024;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EduTdZSqxhoe0+O4YJXgiX7jRForw1G8cwX8mKcHAgA=;
        b=IqCRIQkrCnOqjGcq4QL+Mz3nFdSvQwTPTb9LWlZScfJXrzahLO2UJ5Y3/GnTN58Ezx
         uAdqBWwrJ0aYHIVw6eNSCfzrieoBu7N0G1hlsYhKJrz3QWlxvGFldogBTA6iO99P3Clz
         U8m/eRzuCK5vws5N3Qm+CBWJXgJmSA6oxYyQpHIwMlpHNutk1Q0Lh+gXT9tBVV/aVQzL
         JDvKKhtO1VlW7NVr1AFmednUn7HGx2xLcU5os+dGXZAB38QF45gEVye0ZINseKroiUZ9
         pTJg7nyNRQ8HjdjHtLen0USj0yuyBahf1OfmMCjsw3vne+wNojHy/+OSOHh6IV4tuoc3
         tegQ==
X-Gm-Message-State: APuU4Z8rjF4O76cy2xjzSnZmJ68CYXeaQqyIj1U/qzeSSC4tBZFlmHe0
	J9asoDJfcp1KHeYweTRynVcq7gF3PCpMwqgVbf7pWeMx3ye7jz/IXWUM7YW/DTtfVjG2oRGVHku
	M4RTDxO6Xg+4TW7C+yFYFC1Hf1pBNjpnACXLgdyHK4zwJNQzOwoEGJJ82zETREwh6EgB5gqtz2N
	rv435YXOhgAGabthr2I2itUa1pDP4rIgFbBdmgVmQGNcy0
X-Received: from wrsh4.prod.google.com ([2002:adf:fd44:0:b0:4ac:7cc3:5b5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5246:b0:4bb:6de4:2f7c
 with SMTP id 5b1f17b1804b1-4bb8881c5bdmr248924475e9.20.1795445223568; Mon, 23
 Nov 2026 06:47:03 -0800 (PST)
Date: Mon, 23 Nov 2026 15:46:35 +0100
In-Reply-To: <20261123144633.2725921-4-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261123144633.2725921-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1287; i=ardb@kernel.org;
 h=from:subject; bh=u7mxD/anA7Eu8aHSc94KcI5sVUUlA2qCtL+x8FQt9fg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZsl8PSjim8u9R6PpLWf7vBmfyl1Kat/8sd51gpPJ8z1/
 n2moPB/RykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI4o8MfwWjLe7/OnbnnG7j
 r80T6v++ZJ3aemuGfWCqUOuxgHYJAXOGP5xvZMxvyr3/uuJTOvuHm6HPC4/HHVpkrZ32Q6GnWn9 aKAcA
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123144633.2725921-5-ardb+git@google.com>
Subject: [PATCH 1/2] arm64/boot: Handle RELR relocations more efficiently
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_064706_116175_E6239BB2 
X-CRM114-Status: GOOD (  12.80  )
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

The RELR format consists of anchor entries with bit #0 cleared, that
describe an address in the image's address space to which the runtime
load displacement must be applied, followed by any number of entries
with bit #0 set, whose remaining bits each describe 63 subsequent
positions in the image that need the displacement applied as well.

Iterating over those 63 bits one by one is inefficient, given that we
can use the number of trailing zeroes as an array index directly, and
iteratively clear the least significant 1 bit in x by AND'ing with x-1.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/pi/relocate.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/pi/relocate.c b/arch/arm64/kernel/pi/relocate.c
index 82592f3a5c1c..aa83946193ab 100644
--- a/arch/arm64/kernel/pi/relocate.c
+++ b/arch/arm64/kernel/pi/relocate.c
@@ -55,9 +55,8 @@ void __init relocate_kernel(u64 offset)
 			place = (u64 *)(*relr + offset);
 			*place++ += offset;
 		} else {
-			for (u64 *p = place, r = *relr >> 1; r; p++, r >>= 1)
-				if (r & 1)
-					*p += offset;
+			for (u64 r = *relr >> 1; r; r &= r - 1)
+				place[__ffs(r)] += offset;
 			place += 63;
 		}
 	}
-- 
2.56.1.750.gf70dc682cf-goog


