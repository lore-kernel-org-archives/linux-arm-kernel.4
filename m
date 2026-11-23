Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F406A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LdTEne2n;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GQXKWeEm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zneSiQI6poXUNb55ow1y6hPaWaUVwotiFPIPR4UK1F4=; b=LdTEne2nwIea5cUD4I6nnTPCZs
	Le2ycWqSeglmEwGjl/7f4jHnKv8A26s3QIYdMtGASTjQb2gQVGSNbDkA6FnnAfYjqUzQbLaudG9GS
	eGC8Ahhtie3pTLTkm7yHyVZW+8sz5VhgR8/X58nAiHwIyIDD32jH3xl6yYstBX4Kt+fb0rqWFPlCo
	f2twF5oeJMSjvGz45fDJmLkuRsECejMULjaVKxD65lel8q+47t/awGB0Z3fIX8weXxZ6A9S2THniE
	sOnJNe8YmFhsa2f/qeMTRFH4DWhdUX2ayl86bf0UGqDMNFKz7S892BsfzLX0KVPGw9blmi3HWF2k1
	QbjGdEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVK8-00000003mZR-1OXE;
	Mon, 23 Nov 2026 14:47:16 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVK0-00000003mXN-18fW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:47:09 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-4a7c864000eso1931327f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 06:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795445226; x=1796050026; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zneSiQI6poXUNb55ow1y6hPaWaUVwotiFPIPR4UK1F4=;
        b=GQXKWeEmuLQdJjP4rx7Uj+cCxoYy7voSXzFRzO9B1XIQqniGgMrhwwoVSEatFoEWXu
         Apvbq6fc+nf9YXpgirrwnR6jgjTbdIMdtyr5SH1TNENdBieFvPnVQJuVTjRcqnDYRZbb
         YzDdInLauNg29HwG9XqtrXl49h7ZvUkiQ+SZI4YQqePB9MDvZxOz77nO6kzsFzGTkgrc
         OneyP8f4FmtDrrdj50Zi92Z7jps9wzH9kbF9mi9i/kMi0XPME5340Q6E6IYgGkLPEFyJ
         WfSxU6fZLGVXQ5dbpy1QIJFNFM94PLrgbhmmYkriRLa7+xoNOU1YNlTn3L9YavF23SE0
         uUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445226; x=1796050026;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zneSiQI6poXUNb55ow1y6hPaWaUVwotiFPIPR4UK1F4=;
        b=wrHbkc6bG14PsLvkrYELvorIf72gq4uf77LPOmnQjwfxAwpLXRy+WC+6RxPQ5kXJtG
         q74ic+cPbQ2rR91lmVpf2N2JI+X3v23u+Zgca52dIYC2h+Y+BQ03+35q+xAPKX3nG680
         W5yUosjQxRBgJj4DJGoOKv4BMHp9+Bh0ax6/50ExEnBV+jQyOl35YBGWcjj0CVGPV1QM
         8wb4LvPiDNYTZ9binD5rPRRpUSXM8wFSd51o5lOr4lkRBNe+Zfs8f4xSQlmPncwQpejb
         dmm25bPOSnMINhti8jIAXkFhTtnHUid3v6fMHyy1kGe6P6bX0oQoz9/L2w3DXFXZn+WF
         OhQw==
X-Gm-Message-State: APuU4Z9YuDlGaMQCp9ciH/HRKUOePSOIry1UliV3qqqMeDyrFaxBXldv
	I7FRKqLk3uvjQObtdsaaYXbo2I4oTe94conJ41UkvWqEHOXRB4bGd5yPnVKVRRpsoHit6b5oIiD
	pv6zrP7laGt2cOiJ62A/RvOn2KDZ764y2zTdt/yKwUEopdSXqxhSDXEH3ybdj/+uSIKBY/ajyIH
	yj2umnMQpT1vT3EMsXjrR8KdB+mwo6xUsgS8EGrh/VB9dj
X-Received: from wrxp11.prod.google.com ([2002:a05:6000:18b:b0:4ac:8ab0:1f3a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2b87:b0:487:13f:f612
 with SMTP id ffacd0b85a97d-4abb6095d9bmr12964787f8f.37.1795445225163; Mon, 23
 Nov 2026 06:47:05 -0800 (PST)
Date: Mon, 23 Nov 2026 15:46:36 +0100
In-Reply-To: <20261123144633.2725921-4-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261123144633.2725921-4-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=ardb@kernel.org;
 h=from:subject; bh=YIi3bQPBDleFmfxixY8gcL4Bis5cpEMI+lB7updksMo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZsl8KyOqmZ+x4fM/ClHt/Q9dpuV21IadKAl8IGu/n8X/
 xT5+QUdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCJ/tjP8d4k+s0T005Np0v5X
 M3+HHXm1WzPpirGCydskxbninicPRjEyvD9csn7vPus0tsC6Jeta1/Ar5nbfVHmXY10bfTfg/MO rrAA=
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123144633.2725921-6-ardb+git@google.com>
Subject: [PATCH 2/2] arm64/boot: Discard NULL relocation entries
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_064708_315741_8037AD66 
X-CRM114-Status: UNSURE (   9.23  )
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

The arm64 vmlinux image contains preliminary RELA entries for data
objects that are ultimately discarded by the linker:

  Relocation section '.rela.dyn' at offset 0x25a6c28 contains 27631 entries:
      Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
  0000000000000000  0000000000000000 R_AARCH64_NONE                            0
  0000000000000000  0000000000000000 R_AARCH64_NONE                            0
  0000000000000000  0000000000000000 R_AARCH64_NONE                            0
  0000000000000000  0000000000000000 R_AARCH64_NONE                            0
  0000000000000000  0000000000000000 R_AARCH64_NONE                            0
  0000000000000000  0000000000000000 R_AARCH64_NONE                            0
  ...

These are all processed and ignored at boot when applying the KASLR
offset and take up ~650 KiB of .init data for no reason.

So discard the associated .rela sections explicitly.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/vmlinux.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 1869b44ae190..55d5c4db8c26 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -183,6 +183,7 @@ SECTIONS
 	/DISCARD/ : {
 		*(.interp .dynamic)
 		*(.dynsym .dynstr .hash .gnu.hash)
+		*(.rela.discard.*) *(.rela.export_symbol)
 		*(.ARM.attributes)
 	}
 
-- 
2.56.1.750.gf70dc682cf-goog


